//
//  NetworkHelper.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let reachabilityManager = NetworkReachabilityManager()?.isReachable
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager ?? false
    }
}
