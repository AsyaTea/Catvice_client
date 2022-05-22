//
//  ViewModel.swift
//  Catvice
//
//  Created by Asya Tealdi on 05/03/22.
//

import Foundation
import SwiftUI

class CatManager: ObservableObject {
    
    
    @Published var catImages = [Meow]()
    @Published var rng : Int
    
    init() {
        self.rng = Int.random(in: 1...12000)
//        self.fetchCat()
    }
    
    
    
//     func fetchCat() {
//        guard let url = URL(string: "http://127.0.0.1:8080/image/\(rng)") else {
//            return
//        }
//
//        let catImage = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            //Convert to JSON
//            do {
//                let catImages = try JSONDecoder().decode([Meow].self, from: data)
//                DispatchQueue.main.async {
//                    self?.catImages = catImages
//                    print("catimage\(catImages)")
//                }
//            } catch {
//                print("this is a cat error", error)
//            }
//        }
//
//        catImage.resume()
//
//    }
    
    var randomCat : String {
//        catImages.first?.url ?? ""
        "https://catvice.herokuapp.com/image/\(rng)"
    }
    
    
    func newMao() {
        self.rng = Int.random(in: 1...6053)
       
    }
    
}


