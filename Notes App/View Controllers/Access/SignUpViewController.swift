//
//  SignUpViewController.swift
//  Notes App
//
//  Created by Mohamed Skaik on 8/18/20.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    private var userEntityController: UserEntityController!
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUser()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if createUser(){
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
}

extension SignUpViewController{
    
    private func initializeUser(){
        userEntityController = UserEntityController()
    }
    
    private func check() -> Bool{
        if !firstNameText.text!.isEmpty &&
            !lastNameText.text!.isEmpty &&
            !emailText.text!.isEmpty &&
            !phoneText.text!.isEmpty &&
            !passwordText.text!.isEmpty {
                return true
        }
        showAlert(title: "LanguageError", message: "LanguageEnterInfo", style: .destructive)
        return false
    }
    
    private func getData(){
        user = User()
        if let _user = user{
            _user.id = UUID().uuidString
            _user.firstName = firstNameText.text!.lowercased()
            _user.lastName = lastNameText.text!.lowercased()
            _user.email = emailText.text!.lowercased()
            _user.phone = phoneText.text!
            _user.password = passwordText.text!
        }
    }
    
    private func clear(){
        firstNameText.text = ""
        lastNameText.text = ""
        emailText.text = ""
        phoneText.text = ""
        passwordText.text = ""
    }

    private func create(){
        getData()
        if let _user = user{
            userEntityController.create(user: _user)
            UserData.setData(user: _user)
            clear()
        }
}
    
    private func createUser() -> Bool{
        if check(){
            let isCreated = userEntityController.checkExistance(email: emailText.text!.lowercased(), firstName: firstNameText.text!.lowercased())
            if isCreated{
                create()
                UserData.setLogin(status: true)
                return true
            }
            showAlert(title: "LanguageError", message: "LanguageEmailOrUsernameIsExists", style: .destructive)
        }
        return false
    }
    
}

