//
//  CarouselContainerView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 08/04/25.
//

import UIKit

class CarouselContainerViewController: UIViewController {
    
    let isScreenWide = UIScreen.main.bounds.width > 440
    
    private let backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
    }()
    
    private lazy var scribbleImageView1: UIImageView = {
        return self.makeImageView(named: "MainScreenScribble")
    }()
    
    private lazy var scribbleImageView2: UIImageView = {
        return self.makeImageView(named: "MainScreenScribble")
    }()
    
    private lazy var sealImageView: UIImageView = {
        return self.makeImageView(named: "MainScreenSeal")
    }()
    
    private lazy var mammaImageView: UIImageView = {
        return self.makeImageView(named: "MainScreenMamma")
    }()
    
    private lazy var tapeImageView: UIImageView = {
        return self.makeImageView(named: "MainScreenTape")
    }()
    
    private lazy var tagImageView: UIImageView = {
        return self.makeImageView(named: "MainScreenTag")
    }()
    
    private lazy var detailsImageView: UIImageView = {
        return self.makeImageView(named: "titleDetails")
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = FuzzyFontLabel(text: "Diário de Viagem", textStyle: .largeTitle, textColor: .lightGrayText)
        return label
    }()
    
    private let carouselVC = CarouselViewController()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = "Diário de Viagem"
        view.backgroundColor = .background
        setup()
    }
    
    func setup() {
        view.addSubview(backgroundImageView)
        setupImages()
        setupViews()
        setupConstraints()
    }
    
    func setupImages(){
        view.addSubview(scribbleImageView1)
        view.addSubview(scribbleImageView2)
        view.addSubview(sealImageView)
        view.addSubview(mammaImageView)
        view.addSubview(tapeImageView)
        view.addSubview(tagImageView)
    }
    
    func setupViews(){
        addChild(carouselVC)
        view.addSubview(carouselVC.view)
        titleLabel = FuzzyFontLabel(text: "Diário de Viagem", textStyle: isScreenWide ? .extraLargeTitle : .largeTitle, textColor: .lightGrayText)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(detailsImageView)
        view.addSubview(titleStackView)

        carouselVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -32),
            
            sealImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 56),
            sealImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            
            tapeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -4),
            tapeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            mammaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            carouselVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            carouselVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carouselVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailsImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        if (isScreenWide) {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: view.topAnchor),
                scribbleImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                
                scribbleImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                scribbleImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 70),
                
                tagImageView.widthAnchor.constraint(equalToConstant: 400),
                tagImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
                
                mammaImageView.widthAnchor.constraint(equalToConstant: 230),
                mammaImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 400),
                
                sealImageView.widthAnchor.constraint(equalToConstant: 300),
                
                titleStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130)

            ])
        } else {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: -140),
                scribbleImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -140),
                
                scribbleImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 140),
                scribbleImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 140),
                
                tagImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),

                mammaImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 200),
                
                
                titleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)

            ])
        }
        
        carouselVC.didMove(toParent: self)
    }
}

#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}
