//
//  Item.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/03/08.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    
    var parentCatagory = LinkingObjects(fromType: Category.self, property: "items")
    
}
