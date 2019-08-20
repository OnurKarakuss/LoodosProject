//
//  RaitingsModel.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation

struct RatingModel: Codable {
    
    let Source : String?
    let Value : String?
    
    enum CodingKeys : String,CodingKey {
        
        case Source
        case Value
    }
}
