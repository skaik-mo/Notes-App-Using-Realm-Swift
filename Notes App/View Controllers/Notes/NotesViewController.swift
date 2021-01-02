//
//  NotesViewController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 8/19/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet var noteTableView: UITableView!

    private var noteEntityController: NoteEntityController!
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializerView()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteTableView.reloadData()
    }
    
    private func initializerView(){
        navigation()
        initializeTableView()
        initailzerNote()
    }
    
    private func navigation(){
        navigationItem.title = category?.title ?? ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    
    @IBAction func newNoteAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
        vc.isUpdate = false
        vc.category = category
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func initailzerNote(){
        noteEntityController = NoteEntityController()
    }
    
    func initializeTableView(){
        noteTableView.delegate = self
        noteTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.notes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        cell.checkButtonDelegate = self
        cell.indexPath = indexPath
        cell.setData(note: (category?.notes[indexPath.row])!)
        cell.isStatusButton(isStatus: (category?.notes[indexPath.row].status)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
        vc.isUpdate = true
        vc.category = category
        vc.note = category?.notes[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            if let _category = category{
                noteEntityController.delete(index: indexPath.row, category: _category)
                noteTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
}


extension NotesViewController: CheckButton{
    
    func status(indexPath: IndexPath) -> Bool {
        let isStatus: Bool? = category?.notes[indexPath.row].status
        if isStatus!, let _category = category{
            noteEntityController.setStatus(note: _category.notes[indexPath.row], status: false)
            return false
        }
        noteEntityController.setStatus(note: category!.notes[indexPath.row], status: true)

        return true
    }
    
}


