//
//  detailVM.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import Alamofire
import SDWebImage

class DetailVM: NSObject {
    
    public var movieDetailModel: DetailModel?
    
}

extension DetailVM {
    
    func movieInformationRequest(name: String,successCallBack: @escaping (()->())) {
        
        AF.request(Api.movieDetail(movieName: name)).responseData { (response) in
            HUDHelper.hideHud()
            switch response.result {
            case .success(let value):
                do {
                    let movieResponse = try JSONDecoder().decode(DetailModel.self, from: value)
                    self.movieDetailModel = movieResponse
                    successCallBack()
                }catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setTableView(view: DetailView) {
        view.detailNameLabel.text = movieDetailModel?.Title
        view.detailTableView.reloadData()
    }
}
