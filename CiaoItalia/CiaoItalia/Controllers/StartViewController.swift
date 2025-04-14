//
//  ViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 19/03/25.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupBackground()
        setupElements()
        setupButton()
        setupLabels()
    }
    private func setupBackground(){
        let backgroundImage = UIImageView(frame: view.bounds)
        backgroundImage.image = UIImage(named: "backgroundTexture")
        //preenche toda a tela
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        //adiciona a imageview na view
        view.addSubview(backgroundImage)
        //posiciona em relação a profundidade
        view.sendSubviewToBack(backgroundImage)
        let sewing = UIImageView(frame: view.bounds)
        sewing.image = UIImage(named: "sewing")
        sewing.isOpaque = false
        sewing.alpha = 0.4
        //preenche toda a tela
        sewing.contentMode = .scaleToFill
        sewing.clipsToBounds = true
        sewing.translatesAutoresizingMaskIntoConstraints = false
        //adiciona a imageview na view
        view.addSubview(sewing)
        NSLayoutConstraint.activate([
            sewing.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            sewing.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            sewing.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            sewing.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    private func setupLabels(){
        let title = UILabel()
        title.text = "MEU DIÁRIO DE VIAGEM"
        title.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 0
       
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor), // alinha horizontalmente
            title.bottomAnchor.constraint(equalTo: view.centerYAnchor), // alinha verticalmente
            title.widthAnchor.constraint(equalToConstant: 260),           // largura do label
            title.heightAnchor.constraint(equalToConstant: 112)            // altura do label
        ])
        let subtitle = UILabel()
        subtitle.text = "APRENDENDO ITALIANO"
        subtitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        subtitle.textColor = .white
        subtitle.textAlignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false
    
        view.addSubview(subtitle)
        NSLayoutConstraint.activate([
            subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor), // alinha horizontalmente
            subtitle.topAnchor.constraint(equalTo: view.centerYAnchor), // alinha verticalmente
            subtitle.widthAnchor.constraint(equalToConstant: 250),           // largura do label
            subtitle.heightAnchor.constraint(equalToConstant: 50)            // altura do label
        ])
    }
    private func setupElements(){
        let tracing1 = UIImageView()
        tracing1.image = UIImage(named: "tracing1")
        tracing1.contentMode = .scaleAspectFit
        tracing1.clipsToBounds = false
        tracing1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tracing1)
        NSLayoutConstraint.activate(
            [
                tracing1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
                tracing1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
                
            ]
        )
        let tracing2 = UIImageView()
        tracing2.image = UIImage(named: "tracing2")
        tracing2.contentMode = .scaleAspectFit
        tracing2.clipsToBounds = false
        tracing2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tracing2)
        NSLayoutConstraint.activate(
            [
                tracing2.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                tracing2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40),
                tracing2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30)
                
            ]
        )
        let stampItaly = UIImageView()
        stampItaly.image = UIImage(named: "stampItaly")
        //preenche toda a tela
        stampItaly.contentMode = .scaleAspectFit
        stampItaly.clipsToBounds = false
        stampItaly.translatesAutoresizingMaskIntoConstraints = false
        //adiciona a imageview na view
        view.addSubview(stampItaly)
        NSLayoutConstraint.activate([
            stampItaly.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            stampItaly.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stampItaly.widthAnchor.constraint(equalToConstant: 170),
            stampItaly.heightAnchor.constraint(equalToConstant: 180)
        ])
        let stampMilan = UIImageView()
        stampMilan.image = UIImage(named: "stampMilan")
        //preenche toda a tela
        stampMilan.contentMode = .scaleAspectFit
        stampMilan.clipsToBounds = false
        stampMilan.translatesAutoresizingMaskIntoConstraints = false
        //adiciona a imageview na view
        view.addSubview(stampMilan)
        NSLayoutConstraint.activate([
            stampMilan.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            stampMilan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 90),
            stampMilan.widthAnchor.constraint(equalToConstant: 205),
            stampMilan.heightAnchor.constraint(equalToConstant: 177)
        ])
        let tag = UIImageView()
        tag.image = UIImage(named: "tag")
        tag.contentMode = .scaleAspectFit
        tag.clipsToBounds = false
        tag.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tag)
        NSLayoutConstraint.activate(
            [
                tag.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
                tag.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20)
                
            ]
        )
        
    }
    private func setupButton(){
        let openButton = UIButton()
        openButton.setTitle("ABRIR", for: .normal)
        openButton.setTitleColor(UIColor(named: "darkYellow"), for: .normal)
        openButton.backgroundColor = UIColor(named: "lightYellow")
        openButton.layer.cornerRadius = 8
        openButton.layer.borderWidth = 4
        openButton.layer.borderColor = UIColor(named: "darkYellow")?.cgColor
        openButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        openButton.addTarget(self , action: #selector(openApp), for: .touchUpInside)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openButton)
        NSLayoutConstraint.activate([
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            openButton.widthAnchor.constraint(equalToConstant: 170),
            openButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        openButton.transform = CGAffineTransform(rotationAngle: -(.pi / 60))
    }
    @objc func openApp(){
        let nextView = SecondController()
        nextView.view.backgroundColor = .white
        navigationController?.pushViewController(nextView, animated: true)
    }
}

