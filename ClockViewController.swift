//
//  ClockViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

  @IBOutlet weak var myTimeLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      myTimeLabel.text = ""
      _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("updateClock"), userInfo: nil, repeats: true)
      
     
    }


}
