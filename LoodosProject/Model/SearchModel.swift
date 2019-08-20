//
//  SearchModel.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation

struct SearchModel: Codable {
    
    let totalResults : String?
    let Response : String?
    let Search : [DetailModel]?
    let Error: String?
    
    enum CodingKeys : String,CodingKey {
        
        case Response
        case totalResults
        case Search
        case Error
    }
}
