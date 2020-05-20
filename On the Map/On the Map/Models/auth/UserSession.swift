//
//  UserSession.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
struct UserSession: Codable {
    let account: Account?
    let session: Session?
}

struct Account: Codable {
    let registered: Bool
    let key: String
}
