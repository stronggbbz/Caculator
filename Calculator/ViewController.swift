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
    
    var userIsInThemiddleOfTypingANumber = false

    @IBAction func appendDigit(sender: UIButton){
        let digit = sender.currentTitle!
        if userIsInThemiddleOfTypingANumber{
            display.text = display.text! + digit
        }else {
            display.text = digit
            userIsInThemiddleOfTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInThemiddleOfTypingANumber = false;
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
    }
    var displayValue :Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text =  "\(newValue)"
            userIsInThemiddleOfTypingANumber = false
        }
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInThemiddleOfTypingANumber {
            enter()
        }
        switch operation{
        case "×" : performOperation{  $0 * $1 }
        case "➗": performOperation{  $0 / $1 }
        case "➕": performOperation{  $0 + $1 }
        case "➖": performOperation{  $0 - $1 }
        default : break
            
        }
    }
    
    func performOperation(operation :(Double, Double) -> Double ){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }
    }
    
    func multiply(op1 :Double , op2:Double) ->Double {
        return op1 * op2
    }
}

