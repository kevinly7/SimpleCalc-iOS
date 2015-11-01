//
//  ViewController.swift
//  iOSCalc
//
//  Created by Kevin Ly on 10/27/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var isTyping = false
    var total : Double? = nil
    var current : Double? = nil
    var operation = ""
    var arrayCount = [Double]()
    var arrayAvg = [Double]()
    var arrayTotal : Double = 0.0
    var canCount = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numPressed(sender: AnyObject) {
        canCount = true;
        let number = sender.currentTitle
        if isTyping {
            display.text = display.text! + number!!
        } else {
            display.text = number
            isTyping = true
        }
    }
    
    @IBAction func calculate(sender: UIButton) {
        isTyping = false
        current = Double(display.text!)!
        if operation != "" {
            switch operation {
                case "+":
                    total = total! + current!
                case "-":
                    total = total! - current!
                case "*":
                    total = total! * current!
                case "/":
                    total = total! / current!
                case "MOD":
                    total = total! % current!
                default:
                    break
                }
        } else {
            total = current
        }
        display.text = "\(total!)"
        operation = sender.currentTitle!
    }
    
    @IBAction func count(sender: UIButton) {
        isTyping = false
        if canCount {
            current = Double(display.text!)
            arrayCount.append(current!)
            total = Double(arrayCount.count)
            display.text = "\(total!)"
            canCount = false
        }
    }
    
    @IBAction func average(sender: UIButton) {
        isTyping = false
        if canCount {
            current = Double(display.text!)
            arrayTotal += Double(current!)
            arrayAvg.append(current!)
            total = arrayTotal / Double(arrayAvg.count)
            display.text = "\(total!)"
            canCount = false
        }
    }
    
    @IBAction func fact(sender: UIButton) {
        
    }

    @IBAction func equals(sender: UIButton) {
        isTyping = false
        current = Double(display.text!)!
        
        switch operation {
            case "+":
                total = total! + current!
            case "-":
                total = total! - current!
            case "X":
                total = total! * current!
            case "/":
                total = total! / current!
            case "MOD":
                total = total! % current!
            default:
                break
        }
        if total != nil {
            display.text = "\(total!)"
        }
        isTyping = false
        total = nil
        current = nil
        operation = ""
        arrayCount = [Double]()
        arrayAvg = [Double]()
        canCount = false
    }
    
    @IBAction func clear(sender: UIButton) {
        isTyping = false
        total = nil
        current = nil
        operation = ""
        arrayCount = [Double]()
        display.text = "0"
        canCount = false
        arrayTotal = 0.0
        arrayAvg = [Double]()
    }
    
    
    
}

