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
    
    func showLoader() {
        // Capa principal
        let loaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 387
        loaderView.backgroundColor = .white
        // Indicador de carga
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        // Añadimos el indicador a la capa principal
        loaderView.addSubview(loader)
        // Añadimos la capa principal a la vista
        view.addSubview(loaderView)
    }
    
    func hideLoader() {
        view.viewWithTag(387)?.removeFromSuperview()
    }
}
