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
    
}

