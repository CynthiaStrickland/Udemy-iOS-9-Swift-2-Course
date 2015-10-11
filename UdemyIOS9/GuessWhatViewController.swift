//
//  GuessWhatViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/10/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class GuessWhatViewController: UIViewController {

  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var answerTextField: UITextField!
  
  var question : Int = 2
  
  @IBAction func nextButtonPressed(sender: AnyObject) {
    
    if question == 1 {
    
      questionLabel.text = "Think of a number"
      answerTextField.text = ""
      answerTextField.hidden = true
      sender.setTitle("Next", forState: UIControlState.Normal)
      
    } else if question == 2 {
      questionLabel.text = "Multiply it by 5"
    } else if question == 3 {
      questionLabel.text = "Now add 5 to the total"
    } else if question == 4 {
      questionLabel.text = "Multiply the answer by 2"
    } else if question == 5 {
      questionLabel.text = "Now add 2 to the total"
    } else if question == 6 {
      questionLabel.text = "What is the total"
      answerTextField.hidden = false
    } else if question == 7 {
      if answerTextField.text != "" {
        let input : Int = Int(answerTextField.text!)!
        let answer = ((((input - 2) / 2) - 5) / 5)
        questionLabel.text = "You thought of : \(answer)"
      }
    }
}




    
    
    
    
    
    
    
}
  
    override func viewDidLoad() {
        super.viewDidLoad()

      questionLabel.text = ""
      answerTextField.text = ""
      answerTextField.hidden = true
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }

}
