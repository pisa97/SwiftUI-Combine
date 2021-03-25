//
//  MainSurfingSpotsViewModel.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI
import Combine

final class MainSurfingSpotsViewModel: ObservableObject {
    private let apiProvider = APIProvider<SurfingSpotsEndpoint>()
    private let surfingSpotGenerator = SurfingSpotsGenerator(seed: UInt64(100))
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var surfingSpots: SurfingSpots = []
    
    func getSurfingSpots() {
        apiProvider.getData(from: SurfingSpotsEndpoint.getSources)
            .decode(type: SurfingSpotResponse.self, decoder: JSONDecoder())
            .map({ [weak self] (response) -> SurfingSpots in
                guard let self = self else { return [] }
                
                return self.surfingSpotGenerator.generateSurfingSpots(from: response.cities)
            })
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.surfingSpots, on: self)
            .store(in: &bag)
    }
}

