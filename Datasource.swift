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
        let cynthiaUser = User(name: "Cynthia Strickland", username: "@Trinity001", bioText: "My Life", profileImage: #imageLiteral(resourceName: "Lion.PNG"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@RayWenderlich", bioText: "Ray is a developer", profileImage: #imageLiteral(resourceName: "jet.png"))
        
        return [cynthiaUser, rayUser]
    }()
    
    
    //THIS RENDERS OUT THE CELLS
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
