//
//  LocationCell.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
    static let identifier = "LocationCell"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUrl: UILabel!
    
    func configWith(_ info: StudentInformation) {
        labelName.text = info.labelName
        labelUrl.text = info.mediaURL
    }
    
}
