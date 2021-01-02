//
//  User.swift
//  Notes App
//
//  Created by Mohamed Skaik on 9/10/2020.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var password: String = ""
    
    //one to many
    var categories = List<Category>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
 
}
