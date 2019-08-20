//
//  HomeViewController.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 17.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITextFieldDelegate{

    var homeView: HomeView! {
        guard isViewLoaded else { return nil }
        return view as? HomeView
    }
    var timer:Timer?
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.searchResponseTable.register(cellType: SearchTableViewCell.self)
        setTextField()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func setTextField() {
        homeView.searchText.becomeFirstResponder()
        homeView.searchText.attributedPlaceholder = NSAttributedString(string: "Film Adi Giriniz", attributes: K.attributes as [NSAttributedString.Key : Any])
        homeView.searchText.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        timer?.invalidate()
        
        let currentText = homeView.searchText.text ?? ""
        if (currentText as NSString).replacingCharacters(in: range, with: string).count >= 3 {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(performSearch), userInfo: nil, repeats: false)
        }
        
        return true
    }
    
    @objc func performSearch() {
        viewModel.configureMovieSearch(searchText: homeView.searchText.text ?? "" , view: homeView, successkCallBack: {
            if self.viewModel.movieModel?.Error == "Movie not found!" {
                self.createDefaultAlert(title: K.warning, message: K.notMovie)
            }
            self.viewModel.setTableView(view: self.homeView)
        })
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieModel?.Search?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let movieModel = viewModel.movieModel {
            let searchResultViewModel = SearchTableViewCellViewModel(searchModel: movieModel)
            searchResultViewModel.setTableViewCell(cell: cell, indexPath: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewContoller = DetailViewController()
        detailViewContoller.movieName = viewModel.movieModel?.Search?[indexPath.row].Title ?? ""
        self.navigationController?.pushViewController(detailViewContoller, animated: true)
    }
    
}
