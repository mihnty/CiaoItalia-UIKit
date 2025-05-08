//
//  PracticeBackgroundViewController.swift
//  CiaoItalia
//
//  Created by mih on 05/05/25.
//

import UIKit

class PracticeBackgroundViewController: UIViewController {
    
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
    
    private lazy var tapeImageView: UIImageView = {
        return self.makeImageView(named: "MainScreenTape")
    }()
           
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = "Prática"
        view.backgroundColor = .background
        setup()
    }
    
    func setup() {
        view.addSubview(backgroundImageView)
        setupImages()
        setupConstraints()
    }
    
    func setupImages(){
        view.addSubview(scribbleImageView1)
        view.addSubview(scribbleImageView2)
        view.addSubview(tapeImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tapeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -4),
            tapeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
                        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
        
        if (isScreenWide) {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                scribbleImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
                scribbleImageView1.widthAnchor.constraint(equalToConstant: 600),
                
                scribbleImageView2.widthAnchor.constraint(equalToConstant: 600),
                scribbleImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
                scribbleImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 160),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 400),
                                
            ])
        } else {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: -40),
                scribbleImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -80),
                
                scribbleImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 140),
                scribbleImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 140),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 200),
            ])
        }
    }
}

#Preview {
    UINavigationController(rootViewController: PracticeBackgroundViewController())
}
