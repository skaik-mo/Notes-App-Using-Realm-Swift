//
//  Tools.swift
//  Notes App
//
//  Created by Mohamed Skaik on 31/10/2020.
//  Copyright © 2020 Mohamed Skaik. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title: String, message: String, style: UIAlertAction
                    .Style){
        let alertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: style, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


