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
}

