//
//  FlagTableViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/12/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class FlagTableViewController: UITableViewController {

        var countries = ["Brazil", "Canada", "China", "Germany", "Indonesia", "South Africa", "Spain", "United Kingdom", "USA"]
  
        var images = ["brazil", "canada", "china", "germany", "indonesia", "japan", "southafrica", "spain", "uk", "usa"]
    override func viewDidLoad() {
        super.viewDidLoad()
      

    }

// MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.countries.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("self", forIndexPath: indexPath) as! FlagTableViewCell
      
//      cell.textLabel?.text = countries[indexPath.row]
//      cell.detailTextLabel?.text = countries[indexPath.row]
        cell.countryLabel.text = countries[indexPath.row]
        cell.flagImage.image = UIImage(named: images[indexPath.row])
      
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }



    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
              countries.removeAtIndex(indexPath.row)
              images.removeAtIndex(indexPath.row)
          
          tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
          
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let tempCountry1 = countries[fromIndexPath.row]
        let tempCountry2 = countries[toIndexPath.row]
      
        countries[fromIndexPath.row] = tempCountry2
        countries[toIndexPath.row] = tempCountry1
      
        let tempImage1 = images[fromIndexPath.row]
        let tempImage2 = images[toIndexPath.row]
      
        images[fromIndexPath.row] = tempImage2
        images[toIndexPath.row] = tempImage1
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
