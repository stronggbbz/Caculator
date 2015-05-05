//
//  ViewController.swift
//  Calculator
//
//  Created by strong on 15/3/28.
//  Copyright (c) 2015年 Stronglee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var display: UILabel!
    
    var userIsInThemiddleOfTypingANumber : Bool = false

    @IBAction func appendDigit(sender: UIButton){
        let digit = sender.currentTitle!
        if userIsInThemiddleOfTypingANumber{
            display.text = display.text! + digit
        }else {
            display.text = digit
            userIsInThemiddleOfTypingANumber = true
        }
    }
}

