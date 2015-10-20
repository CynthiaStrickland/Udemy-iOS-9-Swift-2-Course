//
//  ContactTableViewController.swift
//  UdemyIOS9COREDATA
//
//  Created by Cynthia Whitlatch on 10/15/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData

class ContactsTableViewController: UITableViewController {
    
    var appDel: AppDelegate = AppDelegate()
    var context: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    
    var results = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = NSFetchRequest(entityName: "Contacts")
        request.resultType = NSFetchRequestResultType.ManagedObjectResultType
        
        let sort1 = NSSortDescriptor(key: "firstName", ascending: true)
        let sort2 = NSSortDescriptor(key: "lastName", ascending: true)
        
        request.sortDescriptors = [sort1, sort2]
        
        do {
            results = [NSManagedObject]()
            results = try context.executeFetchRequest(request) as! [NSManagedObject]
            
            tableView.reloadData()
                        
        } catch _ {
            
            let alertController = UIAlertController(title: "Error", message: "Error Loading Records", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = results[indexPath.row].valueForKey("firstName")! as? String
        cell.detailTextLabel?.text = results[indexPath.row].valueForKey("lastName")! as? String
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let objectToDelete = results[indexPath.row]
            context.deleteObject(objectToDelete)
            do {
                try context.save()
                results.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            }catch _ {
                print("Error in deleting the records")
            }
        }
    }
}