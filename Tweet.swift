//
//  Tweet.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
