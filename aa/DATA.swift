//
//  DATA.swift
//  aa
//
//  Created by SHF on 15/6/29.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

import Foundation
import CoreData

@objc(DATA) class DATA: NSManagedObject {

    @NSManaged var cent: NSNumber
    @NSManaged var name: String
    @NSManaged var score: NSNumber

}
