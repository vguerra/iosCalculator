//
//  ViewController.swift
//  Calculator
//
//  Created by Victor Guerra on 06/03/15.
//  Copyright (c) 2015 Victor Guerra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var typingANumber : Bool = false;
    var operandStack = Array<Double>()
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            typingANumber = false
        }
    }
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if typingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            typingANumber = true
         }
        println("digit = \(digit)")
    }
    
    @IBAction func enter() {
        typingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if typingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation() { $0 * $1 }
        case "÷": performOperation() { $1 / $0 }
        case "+": performOperation() { $0 + $1 }
        case "−": performOperation() { $1 - $0 }
        case "√": performOperation() { sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            let lhs = operandStack.removeLast()
            displayValue = operation(lhs, operandStack.removeLast())
            enter()
        }
    }

    func performOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    func multipy(lop : Double, rop : Double) -> Double {
        return lop * rop
    }

    func divide(lop : Double, rop : Double) -> Double {
        return lop / rop
    }
    
    func sum(lop : Double, rop : Double) -> Double {
        return lop + rop
    }
    
    func subs(lop : Double, rop : Double) -> Double {
        return lop - rop
    }
    
}

