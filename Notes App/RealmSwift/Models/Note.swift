//
//  Note.swift
//  Notes App
//
//  Created by Mohamed Skaik on 9/10/2020.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var descriptionNote: String = ""
    @objc dynamic var status: Bool = false

    let category = LinkingObjects(fromType: Category.self, property: "notes")
    
    override class func primaryKey() -> String? {
        return "id"
    }
 
}
