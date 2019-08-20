//
//  DetailTableViewCell.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit
import SDWebImage

class DetailTableViewCell: UITableViewCell , Reusable{
    
    static var nib: UINib? {
        return UINib(nibName: String(describing: DetailTableViewCell.self), bundle: nil)
    }
    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var detailBigImage: UIImageView!
    
    var viewModel = ViewModel() {
        didSet {
            directorLabel.text = "Yonetmen : " + (viewModel.director ?? "")
            yearLabel.text = "Yil : " + (viewModel.year ?? "")
            writerLabel.text = "Senaryo : " + (viewModel.writer ?? "")
            actorsLabel.text = "Aktorler : " + (viewModel.actors ?? "")
            languageLabel.text = "Dil : "  + (viewModel.language ?? "")
            countryLabel.text = "Ulke : " + (viewModel.country ?? "" )
            detailBigImage.sd_setImage(with: URL(string: viewModel.detailImage ?? ""), completed: nil)
        }
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


extension DetailTableViewCell {
    struct ViewModel {
        var movieDetail: DetailModel?
        var director: String?
        var year: String?
        var writer: String?
        var actors: String?
        var language: String?
        var country: String?
        var source: String?
        var value: String?
        var detailImage: String?
        
    }
}

extension DetailTableViewCell.ViewModel {
    init(movieDetail: DetailModel) {
        self.movieDetail = movieDetail
        director = movieDetail.Director
        year = movieDetail.Year
        writer = movieDetail.Writer
        actors = movieDetail.Actors
        language = movieDetail.Language
        country = movieDetail.Country
        detailImage = movieDetail.Poster
    }
}
