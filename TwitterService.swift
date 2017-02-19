//
//  TwitterService.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/8/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

struct TwitterService {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = TwitterService()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        print("Fetching home feed")
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched our json objects")
            completion(homeDatasource)
        }) { (err) in
            print("Failed to fetch json...", err)
        }
        
        print(2)
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}
