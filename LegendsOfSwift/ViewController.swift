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
    
    var fact = Fact()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        outputLabel.text = ""
        
        firstNameField.text = "Chuck"
        lastNameField.text = "Norris"
        
    }

    @IBAction func getFactPressed(_ sender: UIButton) {
        fact.getData {
            DispatchQueue.main.async {
                self.outputLabel.text = self.fact.quote
            }
        }
    }
    
}

