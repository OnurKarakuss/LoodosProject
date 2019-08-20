//
//  SearchTableViewCell.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmYearLabel: UILabel!
    
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
