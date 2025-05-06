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
    
    private let titleLabel: FuzzyFontLabel
    private let subtitleLabel: NormalFontLabel
    
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
            card.heightAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 400 : 220),
            card.widthAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 920 : 360),
            
            titleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: PracticeCardView.isScreenWide ? 36 : 16),
            titleLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: PracticeCardView.isScreenWide ? 56 : 40),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.widthAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 460 : 200),
            
            imageView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: PracticeCardView.isScreenWide ? -90 : -20),
            imageView.heightAnchor.constraint(equalToConstant: PracticeCardView.isScreenWide ? 320 : 160),
        ])
    }
}

#Preview {
    MainPracticeViewController()
}
