//
//  CalculatorViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

  @IBOutlet weak var resultLabel: UILabel!
  
  @IBAction func buttonOperation(sender: AnyObject) {
  }
  
  @IBAction func buttonDigitPressed(sender: AnyObject) {
    
    if var result : Int = Int(resultLabel.text!) {
      //logic: 5 in label, press 2 is 52.  5 x 10 + tag(pressed 2)=52.  press 0 = 520.  52 x 10 + tag(pressed 0) = 520
    result = result * 10 + sender.tag!
    resultLabel.text = "\(result)"
  }
}
  @IBAction func cancelButton(sender: AnyObject) {
  }
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
      }
  
  
  }



}
