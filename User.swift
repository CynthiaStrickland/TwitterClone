//
//  User.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/5/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import SwiftyJSON


struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
    }
}
