//
//  TabViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "alansegue" {
      
      
      let destinationViewController : AlanTableViewController = segue.destinationViewController as! AlanTableViewController
      destinationViewController.incomingMessage = "Data Received For Alan's View Controller"
      
    } else {
      
      let destinationViewController : MikeViewController = segue.destinationViewController as! MikeViewController
      destinationViewController.incomingMessage = "Data Received For Mike's View Controller"

    }
  }
}
