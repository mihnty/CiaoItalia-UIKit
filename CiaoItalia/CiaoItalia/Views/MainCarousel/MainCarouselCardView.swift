//
//  MainCarouselCardView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 07/04/25.
//

import UIKit
import SwiftUI

class MainCarouselCardView: UICollectionViewCell {
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }
    
    private func setupConstraints() {
        let width70Constraint = whiteSquare.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        width70Constraint.priority = UILayoutPriority(750)
        
        let maxWidthConstraint = whiteSquare.widthAnchor.constraint(lessThanOrEqualToConstant: 360)
        maxWidthConstraint.priority = UILayoutPriority(1000)
        
        let deviceWidth = UIScreen.main.bounds.width
        let isScreenWide = deviceWidth < 405
        let dynamicBottomConstant = isScreenWide ? -32.0 : -48.0
        let dynamicTopConstant = isScreenWide ? -12.0 : 20.0
        
        NSLayoutConstraint.activate([
            width70Constraint,
            maxWidthConstraint,
            whiteSquare.heightAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 1.3),
            whiteSquare.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            whiteSquare.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            image.widthAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 0.9),
            image.topAnchor.constraint(equalTo: whiteSquare.topAnchor, constant: dynamicTopConstant),
            image.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: whiteSquare.bottomAnchor, constant: dynamicBottomConstant)
        ])
    }
    
    func configure(withImageName imageName: String, title: String) {
        image.image = UIImage(named: imageName)
        titleLabel.text = title
    }
}

struct MainCarouselCardViewPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let cell = MainCarouselCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        cell.configure(withImageName: "squareImageTest", title: "Test Title")
        return cell.contentView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

#Preview {
    MainCarouselCardViewPreview()
}
