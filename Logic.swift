//
//  Logic.swift
//  Calculator
//
//  Created by  Stepanok Ivan on 13.08.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct Logic {
    
    private var number: Double?
    
    // Промежуточное вычисление. Первая цифра
    private var intermediateCalculation: (n1: Double,calcMethod: String)?
    
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                intermediateCalculation?.n1 = 0.0
                number = 0.0
                return  0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                if intermediateCalculation?.n1 != nil {
               return Calculate(n2: n)
                }
            } else {
            intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func Calculate(n2: Double) -> Double? {
        if let calc = intermediateCalculation?.calcMethod, let n1 = intermediateCalculation?.n1 {
            switch calc {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default: return n1
            }
            
        } else {
            return nil
        }
    }
    
}



