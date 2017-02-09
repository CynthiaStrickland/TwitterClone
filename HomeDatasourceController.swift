//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Cynthia Whitlatch on 2/3/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON


class HomeDatasourceController: DatasourceController {
    
    // *******   This causes the rerunning of the Layout when the device is rotated!!
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b:241)
        
        setupNavigationBarItems()
        fetchHomeFeed()

//      THIS PROVIDED ALL OF THE DATA FOR THE MOCKUP.... NOW GOING TO LOAD REAL DATA DIRECTLY FROM TWITTER
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource
        
    }
    
    //MARK:   USING TRON
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class Home: JSONDecodable {
        
        let users: [User]

        required init(json: JSON) throws {
            
            var users = [User]()
            
            let array = json["users"].array
            for userJson in array! {
                
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                let bio = userJson["bioText"].stringValue
                
                let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
                
                users.append(user)
            }
            self.users = users
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    fileprivate func fetchHomeFeed() {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print(homeDatasource.users.count)
            self.datasource = homeDatasource

        }) { (err) in
            print("failed", err)
        }
    }
    
    // COLLAPSES GAP
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    //  HEIGHT OF THE CELL
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            //provide estimation for height of cell
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estiamtedFrame = NSString(string:user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estiamtedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero   //Eliminates header/footer except Section 1
            
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
}

