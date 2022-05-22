//
//  Tab.swift
//  Catvice
//
//  Created by Asya Tealdi on 22/03/22.
//

import SwiftUI

struct Tab: View {
    
    @StateObject var catManager = CatManager()
    @StateObject var quoteManager = QuoteManager()
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    var body: some View {
        TabView {
            ContentView(catManager: catManager, quoteManager: quoteManager)
                .tabItem {
                    Image(systemName: "pawprint.fill")
                        .renderingMode(.template)
                    Text("Miaw")
                }
            Favourites(catManager: catManager, quoteManager: quoteManager)
                .tabItem {
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                    Text("Favourites")
                }
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
