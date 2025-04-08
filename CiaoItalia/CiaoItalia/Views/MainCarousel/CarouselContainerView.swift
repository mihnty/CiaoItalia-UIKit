//
//  CarouselContainerView.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 08/04/25.
//

import UIKit

class CarouselContainerViewController: UIViewController {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
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
    
    private let carouselVC = CarouselViewController()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setup()
    }
    
    func setup() {
        view.addSubview(backgroundView)
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
        carouselVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scribbleImageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: -140),
            scribbleImageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -140),
            
            scribbleImageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 140),
            scribbleImageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 140),
            
            tagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -32),
            tagImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            
            sealImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 56),
            sealImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            
            tapeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            tapeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mammaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            mammaImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            carouselVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            carouselVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carouselVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        carouselVC.didMove(toParent: self)
    }
}

#Preview {
    CarouselContainerViewController()
}
