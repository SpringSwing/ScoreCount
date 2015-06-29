//
//  ans.swift
//  leaderView
//
//  Created by MAC on 15/5/29.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

import UIKit
class ans: UIViewController {

    @IBOutlet weak var ans: UICountingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var top:Double = 0
        var down:Double = 0
        // Do any additional setup after loading the view.
        for i in 0 ..< 100
        {
            if myData.score[i] < 60.0
            {
                continue
            }
            top += myData.score[i] * myData.cent[i]
            down += myData.cent[i]
        }
        if(down == 0)
        {
            ans.text = "0"
        }
        else
        {
            var real:Double = top / (down*10)
            var realans = NSString(format: "%.3f",real)
            ans.countFrom( ans.currentValue(), endValue: CGFloat(real) , duration: 1)
         //   ans.text = (realans) as String
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
