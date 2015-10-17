//
//  SearchViewController.swift
//  UdemyIOS9COREDATA
//
//  Created by Cynthia Whitlatch on 10/16/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  @IBOutlet weak var searchTextField: UITextField!

  @IBAction func searchButton(sender: AnyObject) {
    
    
    
  }
  
//  tableView.delegate = self

  @IBOutlet weak var searchTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.delegate = self
      }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! SearchTableViewCell
    return cell
    
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
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
