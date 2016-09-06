//
//  MainTableViewController.swift
//  Goal
//
//  Created by Ulisses Santana on 9/5/16.
//  Copyright © 2016 Ulisses Santana. All rights reserved.
//

import UIKit
import CoreData

class MainTableViewController: UITableViewController {

  var listProjects: [NSManagedObject] = []
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
      
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("addProject"))
      
    }
  
    //saving
    func addProject(){
      let alertController = UIAlertController(title: "Projec created", message: "Project added", preferredStyle: UIAlertControllerStyle.Alert)
      
      let confirmAction = UIAlertAction(title: "Confirm!", style: UIAlertActionStyle.Default, handler: ({
        (_)in
        
          if let field = alertController.textFields![0] as? UITextField {
          
            self.saveProject(field.text!)
            self.tableView.reloadData()
          
          }
        
        
        }
      ))
      
      let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
      
      alertController.addTextFieldWithConfigurationHandler({
        (textField) in
        
        textField.placeholder = "Testing this shit"
        
      })
      
      alertController.addAction(confirmAction)
      alertController.addAction(cancelAction)
      
      self.presentViewController(alertController, animated: true, completion: nil)
      
    }
  
    func saveProject(projectToSave : String){
      let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
      
      let managedContext = appDelegate.managedObjectContext
      
      let projectEntity = NSEntityDescription.entityForName("listProjects", inManagedObjectContext: managedContext)
      
      let project = NSManagedObject(entity: projectEntity!, insertIntoManagedObjectContext: managedContext)
      
      do {
        try managedContext.save()
        
        listProjects.append(project)
      }
      catch{
          print("error 1")
      }
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
  
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listProjects.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

      

        return cell
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

}
