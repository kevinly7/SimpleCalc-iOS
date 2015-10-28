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
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    var displayCount = 0
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numPressed(sender: AnyObject) {
        let number = sender.currentTitle
        
        if isTyping {
            display.text = display.text! + number!!
        } else {
            display.text = number
            isTyping = true
        }
    }
}

