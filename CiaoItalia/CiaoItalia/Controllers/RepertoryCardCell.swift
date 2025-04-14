//
//  RepertoryCardCell.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 08/04/25.
//
import UIKit

class RepertoryCardCell: UITableViewCell {
    static let identifier = "RepertoryCardCell"
    lazy var cardView = RepertoryCardView(frame: .zero, pt: "", it: "", imageName: "")
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSpeaking() {
        cardView.isSpeaking.toggle()
    }
    func setupCardView(){
        contentView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        cardView.layer.cornerRadius = 12
        cardView.clipsToBounds = true
        cardView.layer.borderWidth = 2.0
        cardView.layer.borderColor = UIColor(named: "textColor")?.cgColor
    }
    func configure(pt: String, it: String, imageName: String) {
        cardView.configure(it: it, pt: pt, imageName: imageName)
        self.accessibilityLabel = "Palavra em português: \(pt). Tradução em italiano: \(it)"
        self.accessibilityTraits = .button
    }
}

