//
//  TabBarController.swift
//  firstApp
//
//  Created by Admin on 3/30/22.
//

import UIKit

class TabBarController: UITabBarController {

    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isOpaque = true
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .systemCyan
    }
}
