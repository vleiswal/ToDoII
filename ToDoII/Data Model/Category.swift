//
//  Category.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/03/08.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
