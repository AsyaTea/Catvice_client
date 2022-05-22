//
//  Favourites.swift
//  Catvice
//
//  Created by Asya Tealdi on 22/03/22.
//

import SwiftUI

struct Favourites: View {
    
    @ObservedObject var catManager : CatManager
    @ObservedObject var quoteManager : QuoteManager
    
    let columns = [
           GridItem(.fixed(250)),
           GridItem(.flexible())
       ]
    var body: some View {
        ZStack{
            Color.backgroundColor
                .ignoresSafeArea()
            VStack{
                Text("Catvice")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        HStack{
                            AsyncImage(url: URL(string: catManager.randomCat)) { image in

                            }
                        
                        }
                    }
                }
            }
        }
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        Favourites(catManager: CatManager(), quoteManager: QuoteManager())
    }
}
