//
//  UIFont+Dynamic.swift
//  CiaoItalia
//
//  Created by mih on 10/04/25.
//

import Foundation
import UIKit

extension UIFont {
    static func customFont(_ font: DynamicFont, forTextStyle style: UIFont.TextStyle,
        overrideFontSize: UIContentSizeCategory? = nil) -> UIFont? {
        guard let customFont = UIFont(name: font.fontName(), size: font.fontSize(style: style)) else { return nil }
        
        let scaledFont: UIFont
        let metrics = UIFontMetrics(forTextStyle: style)
        
        scaledFont = metrics.scaledFont(
            for: customFont, compatibleWith: UITraitCollection(
                preferredContentSizeCategory: overrideFontSize ?? .unspecified
            )
        )
        
        return scaledFont
    }
}
