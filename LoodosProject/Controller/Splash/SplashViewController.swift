//
//  SplashViewController.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 19.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    @IBOutlet weak var remoteMasaageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkInternet()
    }
    
    private func checkInternet() {
        HUDHelper.showHud(text: "", alphaValue: 0.4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            guard NetworkHelper.shared.isConnectedToInternet() else {
                HUDHelper.hideHud()
                self.createDefaultAlert(title: K.warning, message: K.notConnectionMessage)
                return
            }
            self.goToHomePage()
        }
    }
    
    private func goToHomePage(){
        
        RCValues.loadDefaultValues()
        RCValues.fetchRemoteConfig { [unowned self] (loodosName) in
            print(loodosName)
            self.remoteMasaageLabel.text = loodosName
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                HUDHelper.hideHud()
                self.goHome()
            }
        }
    }
    func goHome() {
        HUDHelper.hideHud()
        let homeVC = HomeViewController()
        self.navigationController?.setViewControllers([homeVC], animated: true)
    }
}
