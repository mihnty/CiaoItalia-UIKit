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
        let label = FuzzyFontLabel(text: "Cada página traz uma nova situação", textStyle: .title1, textColor: .darkGrey)
       
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = NormalFontLabel(text: "Vivencie desafios reais de viagem e aprenda expressões para guardar na memória.", textStyle: .body, textColor: .darkGrey, textWeight: .medium)
        
        return label
    }()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
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
