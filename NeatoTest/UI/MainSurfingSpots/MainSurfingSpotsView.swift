//
//  MainSurfingSpotsView.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI

struct MainSurfingSpotsView : View {
    @ObservedObject var viewModel = MainSurfingSpotsViewModel()
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        
    let surfingSpotDegreeFormatter: SurfingSpotDegreeFormatter
    
    init(surfingSpotDegreeFormatter: SurfingSpotDegreeFormatter) {
        self.surfingSpotDegreeFormatter = surfingSpotDegreeFormatter
    }
    
    var body: some View {
        VStack {
            if viewModel.surfingSpots.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 50,
                           alignment: .center)
            } else {
                SurfingSpotsList(surfingSpots: viewModel.surfingSpots, surfingSpotDegreeFormatter: surfingSpotDegreeFormatter)
            }
        }
        .onAppear {
            self.viewModel.getSurfingSpots()
        }
        .onReceive(timer, perform: { _ in
            self.viewModel.getRandomDegree()
        })
    }
}
