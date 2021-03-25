//
//  AsyncImage.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    private let height: CGFloat
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:),
        height: CGFloat
    ) {
        self.placeholder = placeholder()
        self.image = image
        self.height = height
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!).resizable().scaledToFill().frame(height: height, alignment: .top)
            } else {
                placeholder
            }
        }
    }
}
