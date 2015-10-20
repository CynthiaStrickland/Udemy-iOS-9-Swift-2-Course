//
//  SearchViewController.swift
//  UdemyIOS9COREDATA
//
//  Created by Cynthia Whitlatch on 10/16/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData


class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var results: [AnyObject]?
    
    var appDel: AppDelegate = AppDelegate()
    var context: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchLabel: UILabel!
    @IBOutlet weak var searchText: UITextField!
    @IBAction func search(sender: AnyObject) {
    
        self.view.endEditing(true)
        loadData(searchText.text!)
    
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchText.text = ""
        searchLabel.text = "0 Records Found"
        loadData(searchText.text!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadData(searchText.text!)
    }
    
    func loadData(search: String) {
        
        results = [AnyObject]()
        
        let request = NSFetchRequest(entityName: "Contacts")
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        
        if search != "" {
            request.predicate = NSPredicate(format: "firstName = %@", search)
        }
        
        let sort1 = NSSortDescriptor(key: "firstName", ascending: true)
        let sort2 = NSSortDescriptor(key: "lastName", ascending: true)
        
        request.sortDescriptors = [sort1, sort2]
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            
            let alertController = UIAlertController(title: "Error", message: "Error Fetching Records from CoreData", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        tableView.reloadData()
        
        
        searchLabel.text = (results?.count)! > 1 ? "\((results?.count)!) records found" : "\((results?.count)!) record found"
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SearchTableViewCell
        
        let firstName: String = results![indexPath.row].valueForKey("firstName")! as! String
        let lastName: String = results![indexPath.row].valueForKey("lastName")! as! String
        let email: String = results![indexPath.row].valueForKey("email")! as! String
        let phone: String = results![indexPath.row].valueForKey("phone")! as! String
        
        cell.nameLabel.text = firstName + " " + lastName
        cell.emailLabel.text = email
        cell.phoneLabel.text = phone
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (results?.count)!
    }
}