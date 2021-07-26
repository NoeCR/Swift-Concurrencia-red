//
//  UIImageVIew+Extension.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
