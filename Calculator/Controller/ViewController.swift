//
//  ViewController.swift
//  Calculator
//
//  Copyright © 2021 Stepanok Ivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var dotButton: UIButton!
    // var char: String = ""
    //var firstChar: Int = 0
    // private - видимость только внутри фигурных скобок, в данном случае внутри класса. fileprivate var - видимость в пределах файла.
    private var isFinishedTypingNumber: Bool = true
    
    override func viewDidLoad() {
        displayValue = 0
        dotButton.isEnabled = false
    }
    
    
    
    // Делаем так, чтобы на выходе всегда был Double и не нужно было делать проверку, а всё, что входит, передавалось в displayLabel
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Произошла чудовищная ошибка!")
            }
                return number
        } set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    private var logic = Logic()

    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        logic.setNumber(displayValue)
        
        isFinishedTypingNumber = true
       
        if sender.currentTitle == "AC" {
            dotButton.isEnabled = false

        }
        
        //displayLabel.text = ""
        
        if let calcMethod = sender.currentTitle {
            if let result = logic.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        dotButton.isEnabled = true
        
        // Мы обертываем в IF LET чтобы если значение nil, оно не выполнялось.
        if let numValue = sender.currentTitle {
            
            //                char = char + String(numValue.last!)
            //                displayLabel.text = char
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                
                
                

                
                
                if numValue == "." {
                    // floor - округление. isInt у нас Bool.
                    
                    let isInt = floor(displayValue) == displayValue
                    // !в начале, это значит if isInt == false. return - выход из проверки ничего не делая и не добавляя точку где не нужно. Если наше округленное значение не равно текущему, это значит, что точка уже стоит и ничего делать не нужно.
                    if !isInt {
                        return
                    }
                    
                }
                
                
                
                
                
                
                displayLabel.text = displayLabel.text! + numValue
                
            }
        }
        
        
        
        //What should happen when a number is entered into the keypad
        
    }
    
}

