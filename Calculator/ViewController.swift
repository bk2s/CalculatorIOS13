//
//  ViewController.swift
//  Calculator
//
//  Copyright © 2021 Stepanok Ivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var char: String = ""
    var firstChar: Int = 0
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
     
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //sender.titleLabel?.text = displayLabel.text
        
        let symbol: String! = sender.currentTitle
        
        char = char + String(symbol.last!)
        displayLabel.text = char
        
        // = sender.currentTitle.inser
        
        //What should happen when a number is entered into the keypad
    
    }

}

