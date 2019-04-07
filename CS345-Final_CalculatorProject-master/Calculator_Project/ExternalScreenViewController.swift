//
//  ExternalScreenViewController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import UIKit

class ExternalScreenViewController: UIViewController {
    
    private let screen: UIScreen
    
    init(screen: UIScreen) {
        self.screen = screen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
