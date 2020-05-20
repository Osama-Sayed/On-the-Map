//
//  StudentsLocation.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
struct StudentsLocation {
    
    static var shared = StudentsLocation()
    
    private init() {}
    
    var studentsInformation = [StudentInformation]()
    
}
