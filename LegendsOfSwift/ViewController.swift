//
//  ViewController.swift
//  LegendsOfSwift
//
//  Created by Jennifer Joseph on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputLabel: UILabel!
    
    //var fact = Fact()
    var factAlternate = FactAlternate()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        outputLabel.text = ""
        
        firstNameField.text = "Chuck"
        lastNameField.text = "Norris"
        
    }
    
    
    func replaceName(quote: String) -> String {
        var new = quote.replacingOccurrences(of: "chuck", with: firstNameField.text!)
        new = new.replacingOccurrences(of: "Chuck", with: firstNameField.text!)
        new = new.replacingOccurrences(of: "norris", with: lastNameField.text!)
        new = new.replacingOccurrences(of: "Norris", with: lastNameField.text!)
        new = new.replacingOccurrences(of: " &quot ", with: " \" ")
        return new
    }
    
    func updateGender(quote: String) -> String {
        var genderQuote = quote
        if genderSegmentedControl.selectedSegmentIndex == 1 {
            genderQuote = genderQuote.replacingOccurrences(of: " he ", with: " she ")
            genderQuote = genderQuote.replacingOccurrences(of: " (he ", with: " (she ")
            genderQuote = genderQuote.replacingOccurrences(of: " He ", with: " She ")
            genderQuote = genderQuote.replacingOccurrences(of: "  him", with: " her")
            genderQuote = genderQuote.replacingOccurrences(of: "  Him ", with: " Her")
            genderQuote = genderQuote.replacingOccurrences(of: " his ", with: " hers")
            genderQuote = genderQuote.replacingOccurrences(of: " His ", with: " Hers")
            genderQuote = genderQuote.replacingOccurrences(of: " beard ", with: " hair ")
        }
        return genderQuote
    }
    

    @IBAction func getFactPressed(_ sender: UIButton) {
        // using Fact.swift:
//        fact.getData {
//            DispatchQueue.main.async {
//                 self.outputLabel.text = self.fact.quote
//            }
//        }
        
        // using FactAlternate.swift:
        factAlternate.getData {
            DispatchQueue.main.async {
                // using Fact.swift:
                // self.outputLabel.text = self.fact.quote
                // using FactAlternate.swift:
                
                self.outputLabel.text = self.replaceName(quote: self.updateGender(quote: self.factAlternate.value))
                //self.outputLabel.text = self.factAlternate.value
            }
        }
    }
    
}

