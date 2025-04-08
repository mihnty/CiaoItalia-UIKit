//
//  RepertoryCardView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

import UIKit
//TODO: fix labels font 
class RepertoryCardView: UIView{
    private let image = UIImageView()
    private let portugueseLabel = UILabel()
    private let italianLabel = UILabel()
    let audio = UIImageView()
    var isSpeaking:Bool = false {
        didSet {
            isSpeaking ? startAudioAnimation() : stopAudioAnimation()
        }
    }
    
    init(frame:CGRect, pt:String, it:String, imageName:String) {
        super.init(frame: frame)
        setupView()
        setupImage(imageName:imageName)
        setupLabels(pt:pt, it:it)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //MARK: view configuration
    func setupView() {
        self.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.3)
        self.audio.animationImages = [
            UIImage(named: "audio"),
            UIImage(named: "audio1"),
            UIImage(named: "audio2"),
            UIImage(named: "audio3")
        ].compactMap { $0 }
        self.audio.animationDuration = 0.65
        self.audio.animationRepeatCount = 0
        self.audio.image =  UIImage(named: "audio")
        self.audio.contentMode = .scaleAspectFit
        self.audio.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.audio)
    }
    func setupImage(imageName:String) {
        self.image.image = UIImage(named: imageName)
        self.image.contentMode = .scaleAspectFit
        self.image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.image)
    }
    func setupLabels(pt:String, it:String) {
        self.portugueseLabel.text = pt
        self.portugueseLabel.textColor = UIColor(named: "textColor")
        self.portugueseLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.portugueseLabel)
        self.italianLabel.text = it
        self.italianLabel.textColor = UIColor(named: "textColor")
        self.italianLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.italianLabel)
    }
   
    func setupConstraints(){
        NSLayoutConstraint.activate([
            self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.audio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.audio.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.audio.widthAnchor.constraint(equalToConstant: 40),
            self.audio.heightAnchor.constraint(equalToConstant: 50),
            self.italianLabel.bottomAnchor.constraint(equalTo: self.image.centerYAnchor),
            self.italianLabel.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10),
            self.portugueseLabel.topAnchor.constraint(equalTo: self.italianLabel.bottomAnchor),
            self.portugueseLabel.leadingAnchor.constraint(equalTo: self.italianLabel.leadingAnchor),
            self.image.widthAnchor.constraint(equalToConstant: 60.0),
            self.image.heightAnchor.constraint(equalToConstant: 100.0),
            self.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    func configure(it:String, pt:String, imageName:String) {
        setupImage(imageName:imageName)
        setupLabels(pt:pt, it:it)
        setupConstraints()
    }
    //MARK: audio animation
    func startAudioAnimation() {
        audio.startAnimating()
        UIView.animate(withDuration: 0.6,
           delay: 0,
           options: [.curveEaseOut],
           animations: {
               self.audio.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
       })

    }
    func stopAudioAnimation(){
        audio.stopAnimating()
        print("parou a animação")
        audio.image = UIImage(named: "audio")
        NSLayoutConstraint.activate([
            self.audio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.audio.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.audio.widthAnchor.constraint(equalToConstant: 40),
            self.audio.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
