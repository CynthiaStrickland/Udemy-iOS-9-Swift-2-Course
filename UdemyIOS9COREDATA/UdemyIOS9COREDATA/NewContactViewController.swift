//
//  NewContactViewController.swift
//  UdemyIOS9COREDATA
//
//  Created by Cynthia Whitlatch on 10/16/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData

class NewContactViewController: UIViewController, UITextFieldDelegate {

  var appDel : AppDelegate = AppDelegate()
  var context : NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  
  @IBAction func saveButton(sender: AnyObject) {
    
    if firstNameTextField.text == "" || lastNameTextField.text == "" || emailTextField.text == "" || phoneTextField.text == "" {
      
      let alertController = UIAlertController(title: "Error", message: "All Fields Must Be Completed", preferredStyle: .Alert)
      alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
      self.presentViewController(alertController, animated: true, completion: nil)
      
    }
    
    
  }
  
        //TAKE CARE OF KEYBOARD
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

      appDel = UIApplication.sharedApplication().delegate
      as! AppDelegate
      context = appDel.managedObjectContext
  
  
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
