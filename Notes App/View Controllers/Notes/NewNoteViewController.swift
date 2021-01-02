//
//  NewNoteViewController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 8/19/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
            
    private var noteEntityController: NoteEntityController!
    var note: Note?
    var category: Category?
    var index: Int?
    var isUpdate: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializerView()

    }
    
    private func initializerView(){
        initializerNote()
        if isUpdate!{
            updateView()
            titles(typeView: "LanguageUpdateNote")
        }else{
            titles(typeView: "LanguageNewNote")
        }
    }
    
    private func titles(typeView: String){
        titleLabel.text = NSLocalizedString("LanguageNote", comment: "")
        typeLabel.text = NSLocalizedString(typeView, comment: "")
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if isUpdate!{
            let isUpdated = update()
            isUpdated ? print("done update") : print("failed update")
        }else{
            let isCreated = create()
            isCreated ? print("done create") : print("failed create")
        }
        
    }
    
}

extension NewNoteViewController{
    
    private func initializerNote(){
        noteEntityController = NoteEntityController()
    }
    
    private func check() ->Bool{
        if !titleText.text!.isEmpty &&
            !descriptionText.text!.isEmpty{
            return true
        }
        showAlert(title: "LanguageError", message: "LanguageEnterInfo", style: .destructive)
        return false
    }

    private func getNote(){
        note = Note()
        if let _note = note{
            _note.id = UUID().uuidString
            _note.title = titleText.text!
            _note.descriptionNote = descriptionText.text!
            //_note.status = false
        }
    }
    
    private func clear(){
        titleText.text = ""
        descriptionText.text = ""
    }
    
    private func create() -> Bool{
        if check(){
            getNote()
            if let _category = category, let _note = note{
                noteEntityController.create(category: _category, note: _note)
                clear()
                return true
            }
        }
        return false
    }
    

    
}

extension NewNoteViewController{
    private func updateView(){
        titleText.text = note?.title
        descriptionText.text = note?.descriptionNote
    }
    
    private func update() -> Bool{
        if check(){
            getNote()
            if let _category = category, let _index = index, let _note = note{
                noteEntityController.update(index: _index, category: _category, noteUpdate: _note)
                showAlert(title: "LanguageSuccessful", message: "LanguageDoneUpdate", style: .default)
                return true
            }
        }
        showAlert(title: "LanguageError", message: "LanguageFailedUpdate", style: .destructive)
        return false
    }
    
}
