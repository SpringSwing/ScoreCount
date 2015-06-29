//
//  data.swift
//  aa
//
//  Created by MAC on 15/6/17.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

import UIKit

@objc class data: NSObject {
     override init()
    {
        var arrName = [String](count: 100, repeatedValue: "")
        var arrScore = [Double](count: 100,repeatedValue: 0)
        var arrCent = [Double](count: 100,repeatedValue: 0)
        name = arrName
        score = arrScore
        cent = arrCent
        
    }
    func del(path p:Int)
    {
        for i in p..<99
        {
            name[p] = name[p+1]
            score[p] = score[p+1]
            cent[p] = cent[p+1]
        }
    }
    var name:Array<String>
    var score:Array<Double>
    var cent:Array<Double>
    
}
