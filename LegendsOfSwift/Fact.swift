//
//  Fact.swift
//  LegendsOfSwift
//
//  Created by Jennifer Joseph on 12/5/20.
//

import Foundation

class Fact {
    var quote : String = ""
    var url = "https://api.chucknorris.io/jokes/random?category=dev"
    
    private struct Result: Codable {
        var value : String
    }
    
    
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
                // in first parameter of .decode(), pass in the type that we are decoding the data into -- we are going to use a set of data structures that allows us to "drill down" into the result --> bpi --> usd --> rate float
                // from above, we are going to decode Result
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.quote = result.value   // must update class properties to get JSON decoded results!
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()   // DON'T FORGET THIS LINE
    }
}
