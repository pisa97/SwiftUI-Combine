//
//  SurfingSpotsList.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI

struct SurfingSpotsList : View {
    @State var surfingSpots: [SurfingSpot]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                Divider()
                ForEach(surfingSpots, id: \.self) { surfingSpot in
                    SurfingSpotRow(surfingSpot: surfingSpot)
                        .animation(.easeInOut)
                }
            }
        }
    }
}

