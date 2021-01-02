//
//  CategoryEntityController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 8/26/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryEntityController {
    let realm = try! Realm()
    
    public func create(category: Category, user: User){
        try! realm.write(){
            user.categories.append(category)
        }
    }

    public func update(index: Int, categoryUpdate: Category, user: User){
        try! realm.write(){
            let category = user.categories[index]
            category.title = categoryUpdate.title
            category.descriptionCategory = categoryUpdate.descriptionCategory
        }
    }
        
    public func delete(index: Int, user: User){
        try! realm.write(){
            user.categories.remove(at: index)
        }
    }
    
}
