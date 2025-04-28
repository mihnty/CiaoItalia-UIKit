//
//  OnBoardingMainViewController.swift
//  CiaoItalia
//
//  Created by mih on 09/04/25.
//

import UIKit

class OnBoardingBackgroundViewController: UIViewController {
    let isScreenWide = UIScreen.main.bounds.width > 405
            
    private lazy var backgroundImageView: UIImageView = {
        return self.makeImageView(named: "backgroundOnBoard")
    }()
    
    private lazy var mapImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mapa"))
        if isScreenWide {
            imageView.contentMode = .scaleAspectFill
        } else {
            imageView.contentMode = .scaleAspectFit
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var tapeImageView: UIImageView = {
        return self.makeImageView(named: "tape")
    }()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

//    private let mainOnBoardingVC = DemoViewController()
    
    private var isOnBoardingSeen: Bool!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.addSubview(backgroundImageView)
        setupImages()
//        setupViews()
        setupConstraints()
    }
    
    func setupImages(){
        view.addSubview(mapImageView)
        view.addSubview(tapeImageView)
    }
    
//    func setupViews(){
//        addChild(mainOnBoardingVC)
//        view.addSubview(mainOnBoardingVC.view)
//    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
//                mainOnBoardingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
//                mainOnBoardingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                mainOnBoardingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                mainOnBoardingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                mapImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                mapImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
                
                tapeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -4),
                tapeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
        ])
        
        if (isScreenWide) {
            NSLayoutConstraint.activate([
               
                tapeImageView.widthAnchor.constraint(equalToConstant: 400),
                
                mapImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
                
            ])
        } else {
            NSLayoutConstraint.activate([

                tapeImageView.widthAnchor.constraint(equalToConstant: 200),
                
                mapImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),

            ])
        }
        
    }
}

#Preview {
    OnBoardingBackgroundViewController()
}
