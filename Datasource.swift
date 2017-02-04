//
//  Datasource.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/4/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["Sophie", "Bella", "Dexter"]
    
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
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
