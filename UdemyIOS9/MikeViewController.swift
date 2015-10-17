//
//  MikeViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class MikeViewController: UIViewController {

  var incomingMessage : String = "No Data Received"

    override func viewDidLoad() {
        super.viewDidLoad()

      print(incomingMessage)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
