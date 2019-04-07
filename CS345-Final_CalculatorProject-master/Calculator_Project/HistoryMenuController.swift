//
//  HistoryMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class HistoryMenuController: UIViewController {
    
    private var externalWindow: UIWindow?
 
    let mainMenuLabel: UILabel = UILabel()
    let clearDataLabel: UILabel = UILabel()
    let menuHeader: UILabel = UILabel()
    let historyData: UILabel = UILabel()

    let calculateManuController = CalculateMenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        //let centerY: CGFloat = screenSize.height / 2
        
        //assign the first tenth of the screen's height to the menu
        let menuHeaderSection: CGFloat = screenSize.height/10
        
        //button constants
        let buttonHeight: CGFloat = screenSize.height/7
        let buttonWidth: CGFloat = screenSize.width-10
        let buttonX: CGFloat = 5
        
        //previous data menu header
        menuHeader.attributedText = NSAttributedString(string: "Previous Data:", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        menuHeader.font = UIFont.systemFont(ofSize: 22)
        menuHeader.textColor = UIColor.black
        menuHeader.textAlignment = NSTextAlignment.center
        menuHeader.frame = CGRect(x: centerX/2, y: menuHeaderSection/2, width: centerX, height: menuHeaderSection)
        self.view.addSubview(menuHeader)
        
        //history data
        print(calculateManuController.getHistoryResults())
        historyData.text?.append(calculateManuController.getHistoryResults().first!)
        historyData.font = UIFont.systemFont(ofSize: 14)
        historyData.textColor = UIColor.black
        historyData.textAlignment = NSTextAlignment.left
        historyData.frame = CGRect(x: centerX/6, y: menuHeaderSection, width: centerX, height: menuHeaderSection*5)
        self.view.addSubview(historyData)
        
        //clear data label
        clearDataLabel.text = "Clear Data"
        clearDataLabel.backgroundColor = UIColor.darkGray
        clearDataLabel.textColor = UIColor.white
        clearDataLabel.textAlignment = NSTextAlignment.center
        clearDataLabel.frame = CGRect(x: buttonX, y: buttonHeight*5-30, width: buttonWidth, height: buttonHeight)
        clearDataLabel.isUserInteractionEnabled = true
        clearDataLabel.layer.cornerRadius = 10.0
        clearDataLabel.clipsToBounds = true
        clearDataLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HistoryMenuController.clearData(_:))))
        self.view.addSubview(clearDataLabel)
        
        //main menuLabel label
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.backgroundColor = UIColor.darkGray
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*6-25, width: buttonWidth, height: buttonHeight)
        mainMenuLabel.isUserInteractionEnabled = true
        mainMenuLabel.layer.cornerRadius = 10.0
        mainMenuLabel.clipsToBounds = true
        mainMenuLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HistoryMenuController.openMainMenu(_:))))
        self.view.addSubview(mainMenuLabel)
        
        self.view.backgroundColor = UIColor.lightGray
    }
    
    @objc func openMainMenu(_ recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    @objc func clearData(_ recognizer: UITapGestureRecognizer) {
    }
    
    // Method to set up an external screen.
    private func setupExternalScreen(screen: UIScreen) {
        if externalWindow == nil {
            externalWindow = UIWindow(frame: screen.bounds)
            externalWindow!.rootViewController = ExternalScreenViewController(screen: screen)
            externalWindow!.screen = screen
            externalWindow!.isHidden = false
        }
    }
    
    // Method to handle the notification when an external screen connects.
    @objc func externalScreenDidConnect(notification: NSNotification) {
        guard let screen = notification.object as? UIScreen else {
            return
        }
        setupExternalScreen(screen: screen)
    }
    
    // Method to handle the notification when an external screen disconnects.
    @objc func externalScreenDidDisconnect(notification: NSNotification) {
        guard let _ = notification.object as? UIScreen else {
            return
        }
        if let ew = externalWindow {
            ew.isHidden = true
            externalWindow = nil
        }
    }
}
