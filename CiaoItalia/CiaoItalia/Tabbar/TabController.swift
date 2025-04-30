//
//  TabController.swift
//  CiaoItalia
//
//  Created by mih on 30/04/25.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.selectedIndex = 0
        
        self.delegate = self

        let appearance = UITabBarAppearance()
               appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .systemGray6
               self.tabBar.standardAppearance = appearance
               self.tabBar.scrollEdgeAppearance = appearance
        self.tabBar.tintColor = .darkYellow
               self.tabBar.unselectedItemTintColor = .gray
    }
    
    // MARK: - Tab Setup
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house.fill"), vc: CarouselContainerViewController())
        let translate = self.createNav(with: "Tradutor", and: UIImage(systemName: "translate"), vc: OnBoardingMainViewController())
        let expression = self.createNav(with: "Expressões Comum", and: UIImage(systemName: "person.wave.2.fill"), vc: MockViewController())
        
        self.setViewControllers([home, translate, expression], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {

        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}

#Preview {
    TabController()
}
