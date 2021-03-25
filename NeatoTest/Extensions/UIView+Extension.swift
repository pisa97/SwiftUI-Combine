//
//  UIView+Extension.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import SwiftUI

/**
 On landscape iPhones that are big enough – iPhone 11 Pro Max, for example –
 SwiftUI’s default behavior is to show the secondary view, and provide the primary view as a slide over.

 - Returns: Although UIKit lets us control whether the primary view should be shown on iPad portrait,
            this is not yet possible in SwiftUI. The StackNavigationViewStyle is a  navigation view
            style represented by a view stack that only shows a single top view at a time.
 */
extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
