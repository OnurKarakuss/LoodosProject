//
//  Attributes.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import UIKit

struct K {
    static let baseUrl = "https://www.omdbapi.com"
    static let warning = "UYARI"
    static let notConnectionMessage = "İnternet bağlantınızı lütfen kontrol ediniz."
    static let notMovie = "Aradığınız film bulunamamıştır."

    
    static let attributes = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 17),
    ]
}
