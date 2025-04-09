//
//  TestFontViewController.swift
//  CiaoItalia
//
//  Created by mih on 08/04/25.
//

import UIKit

class LabelTutorialViewController: UIViewController {
        
    private var titleTest: UILabel = {
        let customFont = UIFont(name: "FuzzyBubbles-Bold", size: 17)!
        let label = UILabel()
        label.text = "Ciao, Italia!"
        label.adjustsFontForContentSizeCategory = true
        // Set adjustsFontForContentSizeCategory to true will automatically updates the font when the device's content size category changes.
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleTest)
        
        titleTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTest.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}

#Preview {
    LabelTutorialViewController()
}
