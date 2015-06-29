//
//  count.swift
//  leaderView
//
//  Created by MAC on 15/5/29.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

import UIKit

var num = 4
var myData = data()
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
        

               // Do any additional setup after loading the view.
    }

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
            
            let paths=[NSIndexPath (forRow: num-1, inSection: 0)]
            num++
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
                tf.text = cell.ll.text
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
                if(action.style == UIAlertActionStyle.Cancel){return }
                
                let tf1 = alert.textFields![0] as! UITextField
                if(tf1.text != "")
                {
                    myData.name[indexPath.row ] = tf1.text
                    
                    cell.ll.text = tf1.text
                }
                let tf2 = alert.textFields![1] as! UITextField
                if(tf2.text != "")
                {
                    myData.score[indexPath.row] = (tf2.text as NSString).doubleValue
                    cell.lll.text = tf2.text
                }
                let tf3 = alert.textFields![2] as! UITextField
                if(tf3.text != "")
                {
                    myData.cent[indexPath.row] = (tf3.text as NSString).doubleValue
                    cell.llll.text = tf3.text
                }
                
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
            {
                cell2.lll.text = ""
            }
            else
            {
                cell2.lll.text = "\(myData.score[indexPath.row])"
            }
            if(myData.cent[indexPath.row] == 0.0)
            {
                cell2.llll.text = ""
            }
            else
            {
                cell2.llll.text = "\(myData.cent[indexPath.row])"
            }
                        
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
        if(indexPath.row != 0 && indexPath.row != num - 1 )
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
            //myData.removeAtIndex(indexPath.row)
            myData.del(path: indexPath.row)
            num--
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
        return num
    }
    
    
}
