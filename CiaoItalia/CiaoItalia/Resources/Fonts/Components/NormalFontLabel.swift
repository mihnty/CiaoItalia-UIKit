//
//  NormalFontLabel.swift
//  CiaoItalia
//
//  Created by mih on 10/04/25.
//

import Foundation
import UIKit

class NormalFontLabel: UILabel {
    
    init(text: String, textStyle: UIFont.TextStyle, textColor: UIColor, textWeight: UIFont.Weight) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = .center
        self.textColor = textColor
        self.numberOfLines = 0
        let baseFont = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: textStyle).pointSize, weight: textWeight)
        self.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: baseFont)
        self.adjustsFontForContentSizeCategory = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
