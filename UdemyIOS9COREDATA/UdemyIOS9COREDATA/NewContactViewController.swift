//
//  NewContactViewController.swift
//  UdemyIOS9COREDATA
//
//  Created by Cynthia Whitlatch on 10/16/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData

var firstName = String?()
var lastName = String?()
var phoneNumber = String?()
var email = String?()

class NewContactViewController: UIViewController, UITextFieldDelegate {

  var appDel : AppDelegate = AppDelegate()
  var context : NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  
  @IBAction func saveButton(sender: AnyObject) {
    
    
    
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
