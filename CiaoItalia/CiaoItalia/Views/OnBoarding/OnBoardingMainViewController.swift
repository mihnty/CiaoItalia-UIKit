//
//  OnBoardingMainViewController.swift
//  CiaoItalia
//
//  Created by mih on 28/04/25.
//

import UIKit

class OnBoardingMainViewController: UIViewController {
        let isScreenWide = UIScreen.main.bounds.width > 440
       
        private let mainOnBoardingVC = DemoViewController()
    
        private let bgOnBoardingVC = OnBoardingBackgroundViewController()
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            setup()
        }
        
        func setup() {
            setupBg()
            setupViews()
            setupConstraints()
        }
        
        func setupViews(){
            addChild(mainOnBoardingVC)
            view.addSubview(mainOnBoardingVC.view)
        }
    
    func setupBg(){
        addChild(bgOnBoardingVC)
        view.addSubview(bgOnBoardingVC.view)
    }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                
                    mainOnBoardingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
                    mainOnBoardingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    mainOnBoardingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    mainOnBoardingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    
                    bgOnBoardingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
                    bgOnBoardingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    bgOnBoardingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    bgOnBoardingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   
            ])
//            
//            if (isScreenWide) {
//                NSLayoutConstraint.activate([
//                   
//                ])
//            } else {
//                NSLayoutConstraint.activate([
//
//                ])
//            }
            
        }
    }

    #Preview {
        OnBoardingMainViewController()
    }
