//
//  ViewModelQuote.swift
//  Catvice
//
//  Created by Asya Tealdi on 12/03/22.
//

import Foundation


class QuoteManager : ObservableObject   {
    
    @Published var advices = [Advice]()
    @Published var currentAdvice = ""
    
    init() {
       
        self.fetch()
      
    }
    
    func fetch() {
        guard let url = URL(string: "https://catvice.herokuapp.com/Advice/advice.json") else {
            return
        }
        
        let advice = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                let advices = try JSONDecoder().decode([Advice].self, from: data)
                DispatchQueue.main.async {
                    self?.advices = advices
                    self?.randomAdvice()
                }
            } catch {
                print("this is an error", error)
            }
        }
        
        advice.resume()
        
        
    }
    
    func newAdvice() {
        self.randomAdvice()
    }
    
    func randomAdvice() {
       currentAdvice = self.advices.randomElement()?.text ?? "Loading"
    }
    
}
