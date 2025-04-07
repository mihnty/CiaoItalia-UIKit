//
//  MainCarouselCardView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 07/04/25.
//

import UIKit

class MainCarouselCardView: UIViewController {
    
    private var imageName: String
    private var cardTitle: String
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var whiteSquare: UIView = {
        let square = UIView()
        square.backgroundColor = .polaroidWhite
        square.layer.cornerRadius = 2
        square.translatesAutoresizingMaskIntoConstraints = false
        return square
    }()
    
    lazy var labelContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    init(frame:CGRect, image: String, title: String) {
        imageName = image
        cardTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        image.image = UIImage(named: imageName)
        titleLabel.text = cardTitle
        whiteSquare.backgroundColor = .white
        
        view.addSubview(whiteSquare)
        whiteSquare.addSubview(image)
        whiteSquare.addSubview(titleLabel)
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        let width70Constraint = whiteSquare.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        width70Constraint.priority = UILayoutPriority(750)

        let maxWidthConstraint = whiteSquare.widthAnchor.constraint(lessThanOrEqualToConstant: 270)
        maxWidthConstraint.priority = UILayoutPriority(1000)
        
        NSLayoutConstraint.activate([
            width70Constraint,
            maxWidthConstraint,
            whiteSquare.heightAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 1.3),
            whiteSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whiteSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            image.widthAnchor.constraint(equalTo: whiteSquare.widthAnchor, multiplier: 0.9),
            image.topAnchor.constraint(equalTo: whiteSquare.topAnchor, constant: -20),
            image.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: whiteSquare.bottomAnchor, constant: -32)
        ])
    }
}

#Preview {
    MainCarouselCardView(frame: CGRect(), image: "squareImageTest", title: "Teste de exemplo")
}
