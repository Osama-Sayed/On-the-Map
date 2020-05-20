//
//  Extensions.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundCorners(radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
}

extension Notification.Name {
    static let reload = Notification.Name("reload")
    static let reloadStarted = Notification.Name("reloadStarted")
    static let reloadCompleted = Notification.Name("reloadCompleted")
}
