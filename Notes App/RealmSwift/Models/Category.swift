//
//  Category.swift
//  Notes App
//
//  Created by Mohamed Skaik on 9/10/2020.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var descriptionCategory: String = ""
    	
    let user = LinkingObjects(fromType: User.self, property: "categories")
    
    let notes = List<Note>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
 
}
