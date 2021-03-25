//
//  SurfingSpotsList.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI

struct SurfingSpotsList : View {
    var surfingSpots: [SurfingSpot]
    @State var surfingSpotDegreeFormatter: SurfingSpotDegreeFormatter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 32) {
                Divider()
                ForEach(surfingSpots, id: \.self) { surfingSpot in
                    SurfingSpotRow(surfingSpot: surfingSpot, surfingSpotDegreeFormatter: surfingSpotDegreeFormatter)
                        .animation(.easeInOut)
                }
            }
        }
    }
}

