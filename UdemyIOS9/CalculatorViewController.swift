//
//  CalculatorViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

  var op: Int = 0             // Starts at tag 0
  var setZero: Bool = true    // Will reset label to 0 after operator is pressed.
  var operand: Int = 0        // After an operator is pressed the value that was entered is stored in this variable.
  
  @IBOutlet weak var resultLabel: UILabel!
  
    @IBAction func buttonDigitPressed(sender: AnyObject) {
    if setZero {
      resultLabel.text = "0"
      setZero = false
    }
    
    var result : Int = Int(resultLabel.text!)!
      //logic: 5 in label, press 2 is 52.  5 x 10 + tag(pressed 2)=52.  press 0 = 520.  52 x 10 + tag(pressed 0) = 520
      result = result * 10 + sender.tag!
      resultLabel.text = "\(result)"
}

  @IBAction func cancelButton(sender: AnyObject) {
    resultLabel.text = "0"
  }
  
  @IBAction func equalsButton(sender: AnyObject) {
    operand = calculateResult(oprtr: op)
      resultLabel.text = "\(operand)"
      op = 0
      setZero = true
  }
  
  @IBAction func operatorPressed(sender: AnyObject) {
    
    if op != 0 {
      
      operand = calculateResult(oprtr: op)
      resultLabel.text = "\(operand)"
      setZero = true
      op = sender.tag
      
    } else {
      
      let res: Int = Int(resultLabel.text!)!
      operand = res
      setZero = true
      op = sender.tag
    }
  }
  

  func calculateResult(oprtr oprtr: Int) -> Int {
    var returnValue: Int = Int(resultLabel.text!)!
    
    switch(oprtr) {
    case 1:
      returnValue = operand * returnValue
      break
      
    case 2:
      returnValue = operand / returnValue
      break
      
    case 3:
      returnValue = operand + returnValue
      break
      
    case 4:
      returnValue = operand - returnValue
      break
      
    default:
      break
    }
    return returnValue
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      setZero = true
      op = 0

      func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
      }
  
  
  }



}
