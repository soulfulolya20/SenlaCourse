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
        
        setUp()
    }
}

private extension TabBarController {
    func setUp() {
    let mainVC = RockPaperScissorsController()
    let SecondVC = CubeGameController()
    
    let navMain = NavigationController(
        rootViewController: mainVC
    )
    
    navMain.navigationBar.tintColor = .systemCyan
    
    navMain.tabBarItem = UITabBarItem(
        title: "The oldest game",
        image: UIImage(systemName: "scissors.circle"),
        tag: 1
    )
    
    let configuration = UIImage.SymbolConfiguration(
        pointSize: 19, weight: .medium
    )
    navMain.tabBarItem.selectedImage = UIImage(systemName: "scissors.circle.fill", withConfiguration: configuration)
    
    let navSecond = NavigationController(
        rootViewController: SecondVC
    )
    navSecond.tabBarItem = UITabBarItem(
        title: "Cube game",
        image: UIImage(systemName: "cube"),
        tag: 1)
    navSecond.tabBarItem.selectedImage = UIImage(systemName: "cube.fill", withConfiguration: configuration)
        
        setViewControllers([navMain, navSecond], animated: false)
    }
}
