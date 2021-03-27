//
//  SurfingSpotRow.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Combine
import SwiftUI

struct SurfingSpotRow : View {
    let surfingSpot: SurfingSpot
    let surfingSpotDegreeFormatter: SurfingSpotDegreeFormatter

    
    var body: some View {

        ZStack(alignment: .bottomLeading) {
            
            if let imageUrl = surfingSpot.imageUrl,
               let url = URL(string: imageUrl) {
                AsyncImage(
                    url: url,
                    placeholder: {
                        Text("")
                    },
                    image: { Image(uiImage: $0) }, height: 200
                ).frame(width: UIScreen.main.bounds.width - 32)
            }
            
            Rectangle()
                .foregroundColor(.gray)
                .opacity(surfingSpotDegreeFormatter.getWeatherStatus(from: surfingSpot.degree) == .cloudy ? 1.0 : 0)
            
            articleInfo
        }
        .cornerRadius(8)
        .padding([.leading, .trailing], 16)
        .shadow(color: .black, radius: 5, x: 0, y: 0)
        .frame(height: 200)
    }
    
    private var articleInfo: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text(verbatim: surfingSpot.name)
                .foregroundColor(.white)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
            
            Text(verbatim: surfingSpotDegreeFormatter.getFormattedDegreeData(from: surfingSpot.degree))
                .foregroundColor(.white)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .padding([.bottom], 10)
        }).padding([.leading], 10)
    }
}
