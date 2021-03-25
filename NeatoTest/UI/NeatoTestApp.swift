//
//  NeatoTestApp.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import SwiftUI

@main
struct NeatoTestApp: App {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainSurfingSpotsView(surfingSpotDegreeFormatter: SurfingSpotDegreeFormatter())
                    .navigationBarTitle(Text("Surfing Spots"), displayMode: .large)
            }.phoneOnlyStackNavigationView()
        }
    }
}
