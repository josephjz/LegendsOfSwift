//
//  FactAlternate.swift
//  LegendsOfSwift
//
//  Created by Jennifer Joseph on 12/5/20.
//

// more efficient than creating Result struct in Fact.swift

import Foundation

class FactAlternate : Codable {     // now the class is codable -- can use this class to directly decode JSON
                                    // now it needs the value property (exactly how it is in JSON page)
    
    var value : String = ""
    var url = "https://api.chucknorris.io/jokes/random?category=dev"
    
    
    func getData(completed: @escaping ()->()) {
        let urlString = url // API url
        print("accessing this given url: \(urlString)")
        
        // create URL
        guard let url = URL(string: urlString) else {
            print("ERROR: could not create a URL from this given url: \(urlString).")
            completed()
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            // deal with the data
            do {
                let fact = try JSONDecoder().decode(FactAlternate.self, from: data!)     // our Result class does not exist anymore, so we have to replace it w class that does -- FactAlterate
                // we cant decode directly into the class we have our data in, so we have to create a local constant (fact) to hold JSON decoded value
                self.value = fact.value
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()   // DON'T FORGET THIS LINE
    }
}
