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
    
    private let tableCard = PracticeTableViewController()

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
        
    func setupViews() {
        addChild(tableCard)
        view.addSubview(tableCard.view)
        tableCard.view.translatesAutoresizingMaskIntoConstraints = false
        tableCard.didMove(toParent: self)
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
            
            detailsImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        if isScreenWide {
            NSLayoutConstraint.activate([
                titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                
                tableCard.view.topAnchor.constraint(equalTo: detailsImageView.topAnchor, constant: 74),
                tableCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableCard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableCard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                titleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
                
                tableCard.view.topAnchor.constraint(equalTo: detailsImageView.topAnchor, constant: 50),
                tableCard.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableCard.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableCard.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }
}

#Preview {
    UINavigationController(rootViewController:TabController())
}
