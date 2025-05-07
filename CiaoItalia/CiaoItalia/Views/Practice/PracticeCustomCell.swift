//
//  PracticeCustomCell.swift
//  CiaoItalia
//
//  Created by mih on 06/05/25.
//

import UIKit

class PracticeCardTableViewCell: UITableViewCell {
    
    static let identifier = "PracticeCardTableViewCell"
    
    private var cardView: PracticeCardView?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String, title: String, subtitle: String, accessibilityLabel: String) {
//        cardView?.removeFromSuperview()

        let newCard = PracticeCardView(
            imageName: imageName,
            titleText: title,
            subtitleText: subtitle,
            imageAccessibilityLabel: accessibilityLabel
        )

        self.cardView = newCard
        newCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newCard)

        NSLayoutConstraint.activate([
            newCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newCard.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}

#Preview {
    PracticeTestViewController()
}
