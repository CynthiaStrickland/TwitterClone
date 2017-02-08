//
//  Datasource.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/4/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let cynthiaUser = User(name: "Cynthia Strickland", username: "@Trinity001", bioText: "Writing this Twitter app based on Brian's fantastic Let's Build This App YouTube video tutorials!!!", profileImage: #imageLiteral(resourceName: "Profilepic"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@RayWenderlich", bioText: "Ray is a developer", profileImage: #imageLiteral(resourceName: "jet.png"))
        
        return [cynthiaUser, rayUser]
    }()
    
    let tweets: [Tweet] = {
        
        let cynthiaUser = User(name: "Cynthia Strickland", username: "@Trinity001", bioText: "Writing this Twitter app based on Brian's fantastic Let's Build This App YouTube video tutorials!!!", profileImage: #imageLiteral(resourceName: "Profilepic"))
        
        let tweet = Tweet(user: cynthiaUser, message: "Welcome I am writing this Twitter app based on Brian's fantastic Let's Build This App YouTube video tutorials!!!")
        
        let tweet2 = Tweet(user: cynthiaUser, message: "Welcome I am writing this Twitter app based on Brian's fantastic Let's Build This App YouTube video tutorials!!!")
        
        return [tweet, tweet2]
    }()
    
    //THIS RENDERS OUT THE CELLS
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
