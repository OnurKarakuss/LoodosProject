//
//  SearchViewModel.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class SearchViewModel: NSObject {
    public var movieModel:SearchModel?
    
}

extension SearchViewModel {
    
    func configureMovieSearch(searchText: String, view: HomeView, successkCallBack: @escaping (()->())) {
        HUDHelper.showHud(text: "", alphaValue: 0.0)
        AF.request(Api.search(title: searchText)).responseData { (response) in
            HUDHelper.hideHud()
            switch response.result {
            case .success(let value):
                do {
                    let searchResponse = try JSONDecoder().decode(SearchModel.self, from: value)
                    print("RESPONSE : " ,searchResponse)
                    self.movieModel = searchResponse
                    successkCallBack()
                    HUDHelper.hideHud()
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setTableView(view: HomeView) {
        view.searchResponseTable.reloadData()
    }
}


class SearchTableViewCellViewModel: NSObject {
    public var searchResponseModel: SearchModel
    
    init(searchModel: SearchModel) {
        self.searchResponseModel = searchModel
    }
}

extension SearchTableViewCellViewModel {
    
    func setTableViewCell(cell: SearchTableViewCell, indexPath: Int) {

        cell.filmNameLabel.text = "Film Adi : " + (searchResponseModel.Search?[indexPath].Title ?? "" )
        cell.filmYearLabel.text = "Film yili : " + (searchResponseModel.Search?[indexPath].Year ?? "" )
        cell.filmImage.sd_setImage(with: URL(string: searchResponseModel.Search?[indexPath].Poster ?? ""))
    }
}
