//
//  RemoteConfig.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 20.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import Firebase

class RCValues {
    
    static let sharedInstance = RCValues()
    
    private static let loodosName = "loodos_message"
    
    class func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            loodosName : ""
        ]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
    }
    
    class func fetchRemoteConfig(closure : @escaping (String)->()){
        
        RemoteConfig.remoteConfig().fetch {(status, error) in
            guard error == nil else{
                print("Bir hata oluştu.\(String(describing: error))")
                return
            }
            RemoteConfig.remoteConfig().activateFetched()
            
            let companyString = RemoteConfig.remoteConfig().configValue(forKey: loodosName).stringValue ?? "LOODOS"
            closure(companyString)
        }
    }
    
    
    
    func fetchCloudValues() {
        let fetchDuration: TimeInterval = 0
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) { status, error in
            
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            RemoteConfig.remoteConfig().activateFetched()
            print("Retrieved values from the cloud!")
        }
    }
}

