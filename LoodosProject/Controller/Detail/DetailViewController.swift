//
//  DetailViewController.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = DetailVM()
    var movieName: String = ""
    
    var detailView: DetailView! {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.detailTableView.register(cellType: DetailTableViewCell.self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let name = movieName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        viewModel.movieInformationRequest(name: name ?? "") {
            self.viewModel.setTableView(view: self.detailView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        HUDHelper.showHud(text: "", alphaValue: 0.5)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let detail = viewModel.movieDetailModel {
            cell.viewModel = DetailTableViewCell.ViewModel(movieDetail: detail)
        }
        return cell
    }
    
}
