//
//  PracticeCardViewController.swift
//  CiaoItalia
//
//  Created by mih on 05/05/25.
//

import UIKit

class PracticeCardView: UIView {
    
    private static let isScreenWide = UIScreen.main.bounds.width > 440

    let imageView = UIImageView()
    private let titleLabel: FuzzyFontLabel
    private let subtitleLabel: NormalFontLabel
    
    private let card: UIView = {
        let view = UIView()
        view.layer.cornerRadius = PracticeCardView.isScreenWide ? 40 : 20
        view.backgroundColor = .card
        view.alpha = 0.6
        view.layer.borderWidth = PracticeCardView.isScreenWide ? 4 : 2
        view.layer.borderColor = UIColor.darkYellow.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(imageName: String, titleText: String, subtitleText: String, imageAccessibilityLabel: String) {
        self.titleLabel = FuzzyFontLabel(text: titleText, textStyle: PracticeCardView.isScreenWide ? .extraLargeTitle : .title2, textColor: .darkGrey)
        self.subtitleLabel = NormalFontLabel(text: subtitleText, textStyle: PracticeCardView.isScreenWide ? .largeTitle : .body, textColor: .darkGrey, textWeight: .medium)
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.textAlignment = .left

        super.init(frame: .zero)
        
        self.imageView.image = UIImage(named: imageName)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.accessibilityIdentifier = "Polaroid onboarding"
        self.imageView.accessibilityTraits = .image
        self.imageView.isAccessibilityElement = true
        self.imageView.accessibilityLabel = imageAccessibilityLabel
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(card)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: centerXAnchor),
            card.centerYAnchor.constraint(equalTo: centerYAnchor),
            card.heightAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 400 : 190),
            card.widthAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 920 : 360),
            
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: PracticeCardView.isScreenWide ? 36 : 12),
            titleLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: PracticeCardView.isScreenWide ? 56 : 28),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: PracticeCardView.isScreenWide ? 16 : 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 460 : 190),
            
            imageView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: PracticeCardView.isScreenWide ? -90 : -16),
            imageView.heightAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 320 : 160),
        ])
    }
}

#Preview {
//    PracticeCardView(imageName: "italyFlag", titleText: "Primeiras Palavras", subtitleText: "Comece com o vocabulário essencial para se familiarizar com o idioma", imageAccessibilityLabel: "Itália")
    MainPracticeViewController()
}
