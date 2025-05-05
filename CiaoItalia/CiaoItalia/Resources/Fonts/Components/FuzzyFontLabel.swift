//
//  CustomFontLabel.swift
//  CiaoItalia
//
//  Created by mih on 10/04/25.
//

import Foundation
import UIKit

class FuzzyFontLabel: UILabel {
    
    init(text: String, textStyle: UIFont.TextStyle, textColor: UIColor = .black) {
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.customFont(FuzzyBubbles.bold, forTextStyle: textStyle)
        self.textAlignment = .center
        self.textColor = textColor
        self.numberOfLines = 0
        self.adjustsFontForContentSizeCategory = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
