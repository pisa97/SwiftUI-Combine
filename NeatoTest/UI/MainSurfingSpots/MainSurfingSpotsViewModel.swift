//
//  MainSurfingSpotsViewModel.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI
import Combine

final class MainSurfingSpotsViewModel: ObservableObject {
    private let apiProviderSurfingSpots = APIProvider<SurfingSpotsEndpoint>()
    private let apiProviderRandomDegree = APIProvider<WeatherDegreeEndpoint>()
    private let surfingSpotGenerator = SurfingSpotsGenerator(seed: UInt64(100))
    private var randomized = SeededRandomizer(seed: UInt64(100))
    private var bag = Set<AnyCancellable>()
    private var selectableSurfingSpotNamesArray = [String]()
    
    private var lastDegree: Int? {
        didSet {
            
            if selectableSurfingSpotNamesArray.count == 0 { selectableSurfingSpotNamesArray = surfingSpots.map { $0.name } }
            
            let index = Int.random(in: 0..<selectableSurfingSpotNamesArray.count, using: &randomized)

            if let firstIndex = surfingSpots.firstIndex(where: { $0.name == selectableSurfingSpotNamesArray[index]}) {
                surfingSpots[firstIndex].degree = lastDegree
                selectableSurfingSpotNamesArray.remove(at: index)
                surfingSpots = surfingSpots.sorted(by: { $0.degree ?? 0 > $1.degree ?? 0 })
            }
        }
    }
    
    @Published private(set) var surfingSpots: SurfingSpots = []
    
    func getSurfingSpots() {
        apiProviderSurfingSpots.getData(from: SurfingSpotsEndpoint.getSources)
            .decode(type: SurfingSpotResponse.self, decoder: JSONDecoder())
            .map({ [weak self] (response) -> SurfingSpots in
                guard let self = self else { return [] }
                
                self.selectableSurfingSpotNamesArray = response.cities.map { $0.name }
                return self.surfingSpotGenerator.generateSurfingSpots(from: response.cities).sorted(by: { $0.degree ?? 0 > $1.degree ?? 0 })
            })
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.surfingSpots, on: self)
            .store(in: &bag)
    }
    
    func getRandomDegree() {
        apiProviderRandomDegree.getData(from: WeatherDegreeEndpoint.getRandomNumber)
            .decode(type: Degree.self, decoder: JSONDecoder())
            .map({ (response) -> Int in
                return response.number
            })
            .replaceError(with: 0)
            .receive(on: RunLoop.main)
            .assign(to: \.lastDegree, on: self)
            .store(in: &bag)
    }
}

