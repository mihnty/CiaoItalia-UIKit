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
        
        navigationItem.hidesBackButton = true

        self.setupTabs()
        
        self.selectedIndex = 1
        
        self.delegate = self

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        appearance.backgroundColor = nil

        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance

        self.tabBar.tintColor = .caramel
//        self.tabBar.unselectedItemTintColor = .gray
    }
    
    // MARK: - Tab Setup
    
    private func setupTabs() {
        let home = self.createNav(with: "Início", and: UIImage(systemName: "house.fill"), vc: CarouselContainerViewController())
        let translate = self.createNav(with: "Tradutor", and: UIImage(systemName: "translate"), vc: TranslationViewController())
        let expression = self.createNav(with: "Prática", and: UIImage(systemName: "person.wave.2.fill"), vc: MainPracticeViewController())
        
        self.setViewControllers([translate, home, expression], animated: true)
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
