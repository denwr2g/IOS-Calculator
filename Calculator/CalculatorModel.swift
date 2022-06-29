//
//  CalculatorModel.swift
//  Calculator
//
//  Created by deniss.lobacs on 10/02/2022.
//

import Foundation
import UIKit

class CalculatorModel: ViewController {
    
    override func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    override func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            switch sender.tag {
            case 11: result.text = "/"
            case 12: result.text = "x"
            case 13: result.text = "-"
            case 14: result.text = "+"
            default: result.text = ""
            }
            
            operation = sender.tag
            mathSign = true
        }
        
        if sender.tag == 15 {
            switch operation {
            case 11: result.text = String(firstNum / numberFromScreen)
            case 12: result.text = String(firstNum * numberFromScreen)
            case 13: result.text = String(firstNum - numberFromScreen)
            case 14: result.text = String(firstNum + numberFromScreen)
            default: result.text = ""
            }
        }
            
        else if sender.tag == 10 { // clear
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
}
