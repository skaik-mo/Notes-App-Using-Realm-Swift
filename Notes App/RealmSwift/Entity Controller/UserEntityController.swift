//
//  UserEntityController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 8/25/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import RealmSwift

class UserEntityController{
    
    let realm = try! Realm()
    
    public func create(user: User){
        try! realm.write(){
            realm.add(user)
        }
    }
    
    public func getUser(id: String) -> User{
        return realm.objects(User.self).filter("id = '\(id)'").first!
    }
    
    public func read() -> Results<User>{
        return realm.objects(User.self)
    }
    
    public func update(user: User){
        try! realm.write(){
            realm.add(user, update: .modified)
        }
    }
    
    public func checkExistance(email: String, firstName: String) -> Bool{
        let userFirstName: User? = realm.objects(User.self).filter("firstName = '\(firstName)'").first
        let userEmail: User? = realm.objects(User.self).filter("email = '\(email)'").first
        if userFirstName?.firstName == nil && userEmail?.email == nil{
            return true
        }
        return false
    }
    
    public func login(userName: String, password: String) -> (user: User?, isLoggedIn: Bool ){
        let user: User? = realm.objects(User.self).filter("firstName = '\(userName.lowercased())'").first
        if  user?.firstName != nil && user?.password == password{
            return (user, true)
        }
        return (nil, false)
    }
 
}
