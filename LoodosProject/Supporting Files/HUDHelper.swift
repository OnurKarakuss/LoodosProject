//
//  HUDHelper.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import SDWebImage

class HUDHelper: NSObject {
    
    static var progressHUD: MBProgressHUD = MBProgressHUD.init()
    
    static let hudWidth:CGFloat = 100.0
    static let hudHeight:CGFloat = 100.0
    
    static func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static func showHud(text: String, alphaValue: CGFloat) {
        
        let movieImageView = UIImageView(frame: CGRect(x: -hudWidth/2, y: -hudHeight/2, width: hudWidth , height: hudHeight))
        
        let viewTest = UIView(frame: CGRect(x: 0.0, y: 0.0, width: hudWidth, height: hudHeight))
        
        let filePath = Bundle.main.path(forResource: "bullet", ofType: "gif")
        let gifData = NSData(contentsOfFile: filePath ?? "") as Data?
        movieImageView.image = UIImage.sd_animatedGIF(with: gifData)
        movieImageView.contentMode = .scaleAspectFill
        
        viewTest.addSubview(movieImageView)
        
        progressHUD.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(alphaValue)
        
        progressHUD.sizeThatFits(CGSize(width: hudWidth, height: hudHeight))
        progressHUD.customView = viewTest
        progressHUD.mode = .customView
        progressHUD.minSize = CGSize(width: hudWidth, height: hudHeight)
        
        progressHUD.backgroundColor = UIColor.clear
        
        progressHUD.contentColor = UIColor.clear
        
        progressHUD.bezelView.sizeThatFits(CGSize(width: hudWidth, height: hudHeight))
        progressHUD.bezelView.color = UIColor.clear
        progressHUD.bezelView.style = .solidColor
        
        progressHUD.isUserInteractionEnabled = true
        progressHUD.removeFromSuperViewOnHide = true
        
        HUDHelper.getAppDelegate().window!.addSubview(progressHUD)
        HUDHelper.getAppDelegate().window!.bringSubviewToFront(progressHUD)
        
        progressHUD.show(animated: true)
    }
    
    static func hideHud() {
        progressHUD.hide(animated: true)
        
    }
    
    
}
