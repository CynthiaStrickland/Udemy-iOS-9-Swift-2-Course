//
//  TasksTableViewController.swift
//  DayPlanner
//
//  Created by Cynthia Whitlatch on 10/20/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData


class TasksTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

  var appDel : AppDelegate = AppDelegate()
  var context = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      appDel = UIApplication.sharedApplication().delegate as! AppDelegate
      context = appDel.managedObjectContext
    }


// MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (self.fetchedResultsController.sections?.count)!
    }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if self.fetchedResultsController.sections?.count > 0 {
      let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
      return sectionInfo.name
    } else {
      return ""
    }
  }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if self.fetchedResultsController.sections?.count > 0 {
        let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
      } else {
        return 1
      }
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

      self.configureCell(cell, atIndexPath: indexPath)

        return cell
    }

  func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
    let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
    cell.textLabel?.text = object.valueForKey("taskDescription")!.description
    
    let taskStatus = object.valueForKey("taskStatus")!.description
    cell.detailTextLabel?.font = UIFont(name: "Avenir-Medium", size: 12.0)
    cell.detailTextLabel?.text = taskStatus
  }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  // MARK: Fetched Results Controller
  
  var _fetchedResultsController:NSFetchedResultsController? = nil
  var fetchedResultsController : NSFetchedResultsController {
    if _fetchedResultsController != nil {
      return _fetchedResultsController!
    }
    
  let fetchRequest = NSFetchRequest()
  let entity = NSEntityDescription.entityForName("Tasks", inManagedObjectContext: self.context)
    fetchRequest.entity = entity
    
    fetchRequest.fetchBatchSize = 20
    
  let sortDescriptor = NSSortDescriptor(key: "taskDateStamp", ascending: false)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context, sectionNameKeyPath: "taskDate", cacheName: nil)
    aFetchedResultsController.delegate = self
    _fetchedResultsController = aFetchedResultsController
    
    do {
      try _fetchedResultsController!.performFetch()
    } catch {
      abort()
    }
    
    return _fetchedResultsController!
  }
  
  func controllerWillChangeContent(controller: NSFetchedResultsController) {
    self.tableView.beginUpdates()
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    self.tableView.endUpdates()
  }
  
  func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
    switch type {
    case .Insert:
      self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
    case .Delete:
      self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
    default:
      return
    }
  }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: NSManagedObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
      switch type {
      case .Insert:
        self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
      case .Delete:
        self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
      case .Update:
        self.configureCell(tableView.cellForRowAtIndexPath(indexPath!)!, atIndexPath: indexPath!)
      case .Move:
        tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
      default:
        return
      }
    }
  }

