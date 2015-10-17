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
  
  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var phone: UITextField!
  
  @IBAction func saveButton(sender: AnyObject) {
    
    if firstName.text == "" || lastName.text == "" || email.text == "" || phone.text == "" {
      
      let alertController = UIAlertController(title: "Error", message: "All Fields Must Be Completed", preferredStyle: .Alert)
      alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
      self.presentViewController(alertController, animated: true, completion: nil)
      
    } else {
        self.view.endEditing(true)
        
        let newContact = NSEntityDescription.insertNewObjectForEntityForName("Contacts", inManagedObjectContext:context) as NSManagedObject
        
        newContact.setValue(firstName.text, forKey: "firstName")
        newContact.setValue(lastName.text, forKey: "lastName")
        newContact.setValue(email.text, forKey: "email")
        newContact.setValue(phone.text, forKey: "phone")
    }
        
        do {
            try context.save()
            
        let alertController = UIAlertController(title: "Success", message: "Contact Saved", preferredStyle: .Alert)
      alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
      self.presentViewController(alertController, animated: true, completion: nil)
      
            firstName.text = ""
            lastName.text = ""
            email.text = ""
            phone.text = ""
        }
        
        catch _ {
        let alertController = UIAlertController(title: "Error", message: "Contact Not Saved", preferredStyle: .Alert)
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

                    //Setting the variable created above
        
      appDel = UIApplication.sharedApplication().delegate as! AppDelegate
      context = appDel.managedObjectContext
    }
}


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


