//
//  AlertViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
  
  @IBAction func simpleAlert(sender: AnyObject) {
    
    let simpleAlert = UIAlertController(title: "Alert Message", message: "This is an Alert", preferredStyle: UIAlertControllerStyle.Alert)
    
    simpleAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(simpleAlert, animated: true, completion: nil)
    
  }

  @IBAction func multipleButtonAlert(sender: AnyObject) {
    
    let multipleButtonAlert = UIAlertController(title: "Alert Message", message: "This is an Alert", preferredStyle: .Alert)
    
    multipleButtonAlert.addAction(UIAlertAction(title: "YES ", style: UIAlertActionStyle.Default, handler: {
      (alertAction : UIAlertAction!) -> Void in
      print("You Pressed YES")
      }))
    
    multipleButtonAlert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.Default, handler: {
      (alertAction : UIAlertAction!) -> Void in
      print("You Pressed NO")
    }))
    
    multipleButtonAlert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Default, handler: {
      (alertAction : UIAlertAction!) -> Void in
      print("You Pressed CANCEL")
    }))
    
    self.presentViewController(multipleButtonAlert, animated: true, completion: nil)
    
  }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
