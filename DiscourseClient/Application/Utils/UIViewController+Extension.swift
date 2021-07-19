//
//  UIViewController+Extension.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 18/07/2021.
//

import UIKit


extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String = "Ok") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}
