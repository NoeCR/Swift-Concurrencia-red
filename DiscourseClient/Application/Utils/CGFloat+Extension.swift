//
//  CGFloat+Extension.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 26/07/2021.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
