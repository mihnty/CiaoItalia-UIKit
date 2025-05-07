//
//  MainPracticeViewController.swift
//  CiaoItalia
//
//  Created by mih on 05/05/25.
//

import UIKit

class MainPracticeViewController: UIViewController {
    
    let isScreenWide = UIScreen.main.bounds.width > 440
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
   
    private lazy var detailsImageView: UIImageView = {
        return self.makeImageView(named: "titleDetails")
    }()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private var titleLabel: UILabel = {
        let label = FuzzyFontLabel(text: "Prática", textStyle: .largeTitle, textColor: .lightGrayText)
        return label
    }()
    
    private let mainCard1 = PracticeCardView(
        imageName: "italyFlag",
        titleText: "Primeiras Palavras",
        subtitleText: "Comece com o vocabulário essencial para se familiarizar com o idioma.",
        imageAccessibilityLabel: "Foto da bandeira da Itália"
    )

    private let mainCard2 = PracticeCardView(
        imageName: "italyFlag",
        titleText: "Primeiras Palavras",
        subtitleText: "Comece com o vocabulário essencial para se familiarizar com o idioma.",
        imageAccessibilityLabel: "Foto da bandeira da Itália"
    )

    private let bgPracticeVC = PracticeBackgroundViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupBg()
        setupViews()
        setupTitle()
        setupConstraints()
    }
    
    func setupTitle(){
        titleLabel = FuzzyFontLabel(text: "Prática", textStyle: isScreenWide ? .extraLargeTitle : .largeTitle, textColor: .lightGrayText)
        view.addSubview(titleStackView)
        view.addSubview(detailsImageView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(detailsImageView)
    }
        
    func setupViews(){
        view.addSubview(mainCard1)
        mainCard1.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupBg() {
        addChild(bgPracticeVC)
        view.addSubview(bgPracticeVC.view)
        bgPracticeVC.view.translatesAutoresizingMaskIntoConstraints = false
        bgPracticeVC.didMove(toParent: self)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bgPracticeVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            bgPracticeVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgPracticeVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgPracticeVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainCard1.topAnchor.constraint(equalTo: view.topAnchor),
            mainCard1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCard1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCard1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailsImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        if isScreenWide {
            NSLayoutConstraint.activate([
                titleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130)
            ])
        } else {
            NSLayoutConstraint.activate([
                titleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
        }
    }
}

#Preview {
    MainPracticeViewController()
}
