//
//  NoteEntityController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 9/3/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class NoteEntityController{
    let realm = try! Realm()
    
    public func create(category: Category, note: Note){
        try! realm.write(){
            category.notes.append(note)
        }
    }

    public func update(index: Int, category: Category, noteUpdate: Note){
        try! realm.write(){
            let note = category.notes[index]
            note.title = noteUpdate.title
            note.descriptionNote = noteUpdate.descriptionNote
        }
    }
    
    public func setStatus(note: Note, status: Bool){
        try! realm.write(){
            let note = note
            note.status = status
        }
    }
        
    public func delete(index: Int, category: Category){
        try! realm.write(){
            category.notes.remove(at: index)
        }
    }
}
