//
//  MainCarouselCardView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 07/04/25.
//

import UIKit
import SwiftUI

class MainCarouselCardView: UICollectionViewCell {
    weak var delegate: MainCarouselCardViewDelegate?
    var imageAccessibilityLabel: String = ""

    let isScreenWide = UIScreen.main.bounds.width > 440
    
    private let image: UIImageView = {
      let iv = UIImageView()
      iv.contentMode = .scaleAspectFill
      iv.clipsToBounds = true
      iv.translatesAutoresizingMaskIntoConstraints = false
      iv.setContentHuggingPriority(.defaultLow, for: .horizontal)
      iv.setContentHuggingPriority(.defaultLow, for: .vertical)
      iv.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
      iv.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
      iv.accessibilityIdentifier = "Polaroid do carrossel"
      iv.accessibilityHint = "Toque para exibir o repetório"
      iv.isAccessibilityElement = true
      iv.accessibilityTraits = .button
      return iv
    }()
    
    private let titleLabel: FuzzyFontLabel = {
        let lbl = FuzzyFontLabel(text: "", textStyle: .title1, textColor: .lightGrayText)
        return lbl
    }()

    
    private let whiteSquare: UIView = {
        let square = UIView()
        square.backgroundColor = .polaroidWhite
        square.layer.cornerRadius = 2
        square.translatesAutoresizingMaskIntoConstraints = false
        square.layer.shadowColor = UIColor.black.cgColor
        square.layer.shadowOpacity = 0.1
        square.layer.shadowOffset = .zero
        square.layer.shadowRadius = 8
        return square
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(whiteSquare)
        whiteSquare.addSubview(image)
        whiteSquare.addSubview(titleLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        whiteSquare.isUserInteractionEnabled = true
        whiteSquare.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        delegate?.mainCarouselCardViewDidTap(self)
    }
    
    private func setupConstraints() {
        let width70Constraint = whiteSquare.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        width70Constraint.priority = UILayoutPriority(750)
        
        let maxWidthConstraint = whiteSquare.widthAnchor.constraint(lessThanOrEqualToConstant: 480)
        maxWidthConstraint.priority = UILayoutPriority(1000)
        
        let dynamicBottomConstant = isScreenWide ? -48.0 : -32.0
        let dynamicTopConstant = isScreenWide ? 20.0 : 12.0
        
        NSLayoutConstraint.activate([
            width70Constraint,
            maxWidthConstraint,
            whiteSquare.heightAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 1.3),
            whiteSquare.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            whiteSquare.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            image.widthAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 0.9),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.topAnchor.constraint(equalTo: whiteSquare.topAnchor, constant: dynamicTopConstant),
            image.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: whiteSquare.bottomAnchor, constant: dynamicBottomConstant)
        ])
    }
    
    func configure(withImageName imageName: String, title: String, label: String) {
        imageAccessibilityLabel = label
        image.image = UIImage(named: imageName)
        titleLabel.text = title
        let style: UIFont.TextStyle = isScreenWide ? .extraLargeTitle2 : .title2
        titleLabel.font = UIFont.customFont(FuzzyBubbles.bold, forTextStyle: style)
        image.accessibilityLabel = imageAccessibilityLabel
    }
}

struct MainCarouselCardViewPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let cell = MainCarouselCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        cell.configure(withImageName: "squareImageTest", title: "Test Title", label: "ansfasm")
        return cell.contentView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}
