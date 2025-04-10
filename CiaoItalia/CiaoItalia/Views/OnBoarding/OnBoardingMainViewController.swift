//
//  OnBoardingMainViewController.swift
//  CiaoItalia
//
//  Created by mih on 09/04/25.
//

import UIKit

class OnBoardingMainViewController: UIViewController {
    let isScreenWide = UIScreen.main.bounds.width > 405
    
    private let backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundOnBoard"))
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let customFont = UIFont(name: "FuzzyBubbles-Bold", size: 28)!
        label.textColor = .darkGray
        label.text = "Cada página traz uma nova situação"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Vivencie desafios reais de viagem e aprenda expressões para guardar na memória."
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupImages()
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        setupConstraints()

    }
    
    func setupImages(){
        view.addSubview(backgroundImageView)
    
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 400),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 400),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

        ])
    }
}

#Preview {
    OnBoardingMainViewController()
}
