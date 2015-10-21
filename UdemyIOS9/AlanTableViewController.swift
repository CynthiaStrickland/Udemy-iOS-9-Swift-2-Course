//
//  AlanTableViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class AlanTableViewController: UIViewController {

  var incomingMessage : String = "No Data Received"

  @IBAction func backPressed(sender: AnyObject) {
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      print(incomingMessage)

    }



}
