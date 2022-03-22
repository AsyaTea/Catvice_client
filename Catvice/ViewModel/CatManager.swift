//
//  ViewModel.swift
//  Catvice
//
//  Created by Asya Tealdi on 05/03/22.
//

import Foundation

class CatManager: ObservableObject {
    
    
     @Published var catImages = [Meow]()
    
    
    init() {
        self.fetchCat()
   
      
    }
    
    
    
     func fetchCat() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else {
            return
        }
        
        let catImage = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                let catImages = try JSONDecoder().decode([Meow].self, from: data)
                DispatchQueue.main.async {
                    self?.catImages = catImages
                    
                }
            } catch {
                print("this is a cat error", error)
            }
        }
        
        catImage.resume()
        
    }
    
    var randomCat : String {
        catImages.first?.url ?? ""
    }
    
   
    
  
    
    func newMao() {
        self.fetchCat()
    }
    
}


