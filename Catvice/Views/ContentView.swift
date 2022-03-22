//
//  ContentView.swift
//  Catvice
//
//  Created by Asya Tealdi on 05/03/22.
//

import SwiftUI
extension Color {
    static let backgroundColor = Color("Background")
    static let quoteColor = Color("Quote")
}

struct ContentView: View {
    @StateObject var catManager = CatManager()
    @StateObject var quoteManager = QuoteManager()
    @State private var dateNow = Date.now

    var body: some View {
        
        ZStack{
            
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                HStack{
                    
                    Text("Catvice")
                        .font(.title)
                        .fontWeight(.semibold)
                    Image("peepoClown")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                  
                }
              
                    Divider()
                    VStack {
                  
                        Spacer()
                        AsyncImage(url: URL(string: catManager.randomCat)) { image in
                            image.resizable()
                                .frame(width: 350, height: 300, alignment: .center)
                                .cornerRadius(10)
                            
                        } placeholder: {
                            ProgressView()
                        }
                            .frame(width: 350, height: 300, alignment: .center)

                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.quoteColor)
                                .frame(width: 350, height: 150, alignment: .center)
                          
                            Spacer()
                            Text(quoteManager.currentAdvice)
                                .frame(width: 330, height: 150, alignment: .center)
                                .foregroundColor(.black)
                                .font(.title3)
                            
                        }
                      
                        Spacer()
                        HStack {
                            Button {
                                catManager.newMao()
                            } label: {
                                ButtonView(text: "🐈")
                                  
                            }
                            Button {
                                quoteManager.randomAdvice()
                            } label: {
                                ButtonView(text: "💌")
                                    
                            }
                           
                            
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.white)                          
                            DatePicker("Send me a notification at:", selection: $dateNow, displayedComponents: .hourAndMinute)                                                        }
                        .frame(width: 350, height: 50, alignment: .center)
                      
                        Spacer()
                    }
                    
            Spacer()
            }
           
        }
        
        
    }
}

struct ButtonView: View {
    var text : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
            Text(text)
                .foregroundColor(.white)
        }
        .frame(width: 170, height: 50, alignment: .center)
        .font(.title)
    }
}

struct EmptyView: View {
    var body: some View {
        Text("MAo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
