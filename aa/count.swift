//
//  count.swift
//  leaderView
//
//  Created by MAC on 15/5/29.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

import UIKit
import CoreData

<<<<<<< .merge_file_zouD96
var num = 4
var myData = data()
=======
var num:Int?
var first:Bool = false
>>>>>>> .merge_file_UdEk3z
class count: UIViewController {
    //@IBOutlet var ttts: [UITextField]!
    @IBOutlet var realView: UIView!
    var firstResponder :UIView?
    @IBOutlet weak var topconstant: NSLayoutConstraint!
    @IBOutlet weak var lowconstant: NSLayoutConstraint!
    var accessoyView :UIView?
    @IBOutlet weak var myView: UITableView!
   // @IBOutlet weak var tb: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< .merge_file_zouD96
        

               // Do any additional setup after loading the view.
    }

=======
        viewInit()

               // Do any additional setup after loading the view.
    }
    func viewInit()
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var description =  NSEntityDescription.entityForName("DATA", inManagedObjectContext: appDelegate.managedObjectContext!)
        var request = NSFetchRequest()
        request.entity = description
        var array = appDelegate.managedObjectContext?.executeFetchRequest(request, error: nil)
        
        if(array!.count < 2)
        {
            num = 4
            first = true
        }
        else
        {
            num = array!.count + 2
        }
        
    }
>>>>>>> .merge_file_UdEk3z
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! newCell
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.row == 0 ) {return}
        if(indexPath.row == tableView.numberOfRowsInSection(0)-1)
        {
            
<<<<<<< .merge_file_zouD96
            let paths=[NSIndexPath (forRow: num-1, inSection: 0)]
            num++
=======
            let paths=[NSIndexPath (forRow: num!-1, inSection: 0)]
            num!++
>>>>>>> .merge_file_UdEk3z
            tableView.beginUpdates()
            tableView.insertRowsAtIndexPaths(paths, withRowAnimation: UITableViewRowAnimation.Fade)
            var p = NSIndexPath(forRow: indexPath.row+1, inSection: 0)
            tableView.endUpdates()
            tableView.selectRowAtIndexPath(p, animated: true, scrollPosition: UITableViewScrollPosition.Middle)
            
        }
        else
        {
            let alert = UIAlertController(title: "课程信息", message: "", preferredStyle:
                UIAlertControllerStyle.Alert)
            
            alert.addTextFieldWithConfigurationHandler
            {
                (tf:UITextField!) in
                tf.keyboardType = UIKeyboardType.Default
                tf.placeholder = "课程名称"
<<<<<<< .merge_file_zouD96
                tf.text = cell.ll.text
=======
                if(cell.ll.text != "新科目")
                {
                    tf.text = cell.ll.text
                }
>>>>>>> .merge_file_UdEk3z
                tf.clearButtonMode = UITextFieldViewMode.WhileEditing

               // tf.addTarget(self, action: "tt1:", forControlEvents: UIControlEvents.EditingChanged)
            }
            alert.addTextFieldWithConfigurationHandler
                {
                    (tf:UITextField!) in
                    tf.keyboardType = UIKeyboardType.DecimalPad
                    tf.placeholder = "分数"
                    tf.text = cell.lll.text
                    tf.clearButtonMode = UITextFieldViewMode.WhileEditing
                        // tf.addTarget(self, action: "tt1:", forControlEvents: UIControlEvents.EditingChanged)
            }
            alert.addTextFieldWithConfigurationHandler
                {
                    (tf:UITextField!) in
                    tf.keyboardType = UIKeyboardType.DecimalPad
                    tf.placeholder = "学分"
                    tf.text = cell.llll.text
                    tf.clearButtonMode = UITextFieldViewMode.WhileEditing
                        // tf.addTarget(self, action: "tt1:", forControlEvents: UIControlEvents.EditingChanged)
            }

            func handler(action:UIAlertAction!)
            {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                var description =  NSEntityDescription.entityForName("DATA", inManagedObjectContext: appDelegate.managedObjectContext!)
                var request = NSFetchRequest()
                request.entity = description
                
                var array = appDelegate.managedObjectContext?.executeFetchRequest(request, error: nil)
                var p = array![indexPath.row - 1] as! DATA
                if(action.style == UIAlertActionStyle.Cancel){return }
                
                let tf1 = alert.textFields![0] as! UITextField
                if(tf1.text != "")
                {
<<<<<<< .merge_file_zouD96
                    myData.name[indexPath.row ] = tf1.text
=======
                    p.name = tf1.text
>>>>>>> .merge_file_UdEk3z
                    
                    cell.ll.text = tf1.text
                }
                let tf2 = alert.textFields![1] as! UITextField
                if(tf2.text != "")
                {
<<<<<<< .merge_file_zouD96
                    myData.score[indexPath.row] = (tf2.text as NSString).doubleValue
=======
                    p.score = (tf2.text as NSString).doubleValue
>>>>>>> .merge_file_UdEk3z
                    cell.lll.text = tf2.text
                }
                let tf3 = alert.textFields![2] as! UITextField
                if(tf3.text != "")
                {
<<<<<<< .merge_file_zouD96
                    myData.cent[indexPath.row] = (tf3.text as NSString).doubleValue
                    cell.llll.text = tf3.text
                }
                
=======
                    p.cent = (tf3.text as NSString).doubleValue
                    cell.llll.text = tf3.text
                }
                appDelegate.managedObjectContext?.save(nil);

>>>>>>> .merge_file_UdEk3z
            }
            
            alert.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: handler))
            alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: handler))
            presentViewController(alert, animated: true, completion: nil)
           
        
        }

    }

    @IBAction func TouchDown(sender: AnyObject) {
        
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 0)
        {
         var cell3 = tableView.dequeueReusableCellWithIdentifier("cell3", forIndexPath: indexPath) as! newCell
           
            return cell3
            
        }
<<<<<<< .merge_file_zouD96
        if( indexPath.row <= num-2)
        {

            var cell2 = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! newCell

            if(myData.name[indexPath.row] == "")
            {
            cell2.ll.text = "新科目"
            }
            else
            {
                cell2.ll.text = myData.name[indexPath.row]
            }
            if(myData.score[indexPath.row] == 0.0)
=======
        if( indexPath.row <= num!-2)
        {

            var cell2 = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! newCell
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            var description =  NSEntityDescription.entityForName("DATA", inManagedObjectContext: appDelegate.managedObjectContext!)
            var request = NSFetchRequest()
            request.entity = description
            var array = appDelegate.managedObjectContext?.executeFetchRequest(request, error: nil)
            
            if(array?.count < num!-2)
>>>>>>> .merge_file_UdEk3z
            {
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                var p =  NSEntityDescription.insertNewObjectForEntityForName("DATA", inManagedObjectContext: appDelegate.managedObjectContext!) as! DATA
                p.name = "新科目"
                p.score = 0
                p.cent = 0
                cell2.ll.text = p.name
                cell2.lll.text = ""
            }
            else
            {
                cell2.lll.text = "\(myData.score[indexPath.row])"
            }
            if(myData.cent[indexPath.row] == 0.0)
            {
                cell2.llll.text = ""
                appDelegate.managedObjectContext?.save(nil);
            }
            else
            {
<<<<<<< .merge_file_zouD96
                cell2.llll.text = "\(myData.cent[indexPath.row])"
            }
                        
=======

                let p = array![indexPath.row - 1] as! DATA
                cell2.ll.text = p.name
                cell2.lll.text = p.score != 0 ? "\(p.score)" :""
                cell2.llll.text = p.cent != 0 ? "\(p.cent)" :""
            }
    
>>>>>>> .merge_file_UdEk3z
            return cell2
            
        }
        else
        {
            let cell  = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! newCell
                      return cell
        }
        
    }
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
<<<<<<< .merge_file_zouD96
        if(indexPath.row != 0 && indexPath.row != num - 1 )
=======
        if(indexPath.row != 0 && indexPath.row != num! - 1 )
>>>>>>> .merge_file_UdEk3z
        {
            return true
        }
        else
        {
            return false
        }

    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if(editingStyle == UITableViewCellEditingStyle.Delete)
        {
<<<<<<< .merge_file_zouD96
            //myData.removeAtIndex(indexPath.row)
            myData.del(path: indexPath.row)
            num--
=======
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            var description =  NSEntityDescription.entityForName("DATA", inManagedObjectContext: appDelegate.managedObjectContext!)
            var request = NSFetchRequest()
            request.entity = description
            var array = appDelegate.managedObjectContext?.executeFetchRequest(request, error: nil)
            
            let p = array![indexPath.row - 1] as! DATA
                appDelegate.managedObjectContext?.deleteObject(p)
                var result = appDelegate.managedObjectContext?.save(nil)

            num!--
>>>>>>> .merge_file_UdEk3z
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView,titleForDeleteConfirmationButtonForRowAtIndexPath indexPath:NSIndexPath) ->NSString
    {
        return "删除"
    }
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return  1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
<<<<<<< .merge_file_zouD96
        return num
=======
        return num!
>>>>>>> .merge_file_UdEk3z
    }
    
    
}
