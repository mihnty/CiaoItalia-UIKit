//
//  TranslationMockView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslationView:UIView {
    lazy var translateLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Português", textStyle: .body, textColor: .text)
        lb.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.2)
        lb.layer.cornerRadius = 10
        lb.layer.borderWidth = 2
        lb.layer.borderColor = UIColor(named: "darkYellow")?.cgColor
        lb.layer.masksToBounds = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var translateButton:UIButton = {
        var bt = UIButton(type: .system)
        bt.setTitle("Traduzir", for: .normal)
        bt.setTitleColor(.text, for: .normal)
        bt.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.2)
        bt.layer.cornerRadius = 10
        bt.layer.masksToBounds = true
        let scratchLabel = FuzzyFontLabel(text: "", textStyle: .body, textColor: .text)
        bt.titleLabel?.font = scratchLabel.font
        bt.layer.borderWidth = 2
        bt.layer.borderColor = UIColor(named: "darkYellow")?.cgColor
        bt.isEnabled = false
        bt.alpha = 0.5
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    lazy var targetLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Italiano", textStyle: .body, textColor: .text)
        lb.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.2)
        lb.layer.cornerRadius = 10
        lb.layer.borderWidth = 2
        lb.layer.borderColor = UIColor(named: "darkYellow")?.cgColor
        lb.layer.masksToBounds = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var translatedLabel:TranslateTextView = {
        let lb = TranslateTextView()
        lb.setPlaceholder(placeholder: "Tradução")
        lb.disableWrite()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let textField: TranslateTextView = {
        let tv = TranslateTextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let swapLanguageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left.arrow.right")?  .withTintColor(.darkYellow, renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let bg = UIImageView(image: UIImage(named: "backgroundPattern"))
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    lazy var stampIV:UIImageView = {
        let iv = UIImageView(image: UIImage(named: "MainScreenSeal"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    lazy var tagIV:UIImageView = {
        let iv = UIImageView(image: UIImage(named: "MainScreenTag"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    lazy var tapeIV:UIImageView = {
        let iv = UIImageView(image: UIImage(named: "MainScreenTape"))
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    public let recordButton: UIButton = {
        let btn = UIButton(type: .custom)
        let micImage = UIImage(systemName: "microphone.fill")?.withTintColor(.darkYellow, renderingMode: .alwaysOriginal)
        btn.setImage(micImage, for: .normal)
        btn.tintColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        backgroundColor = .white
        
        addSubview(backgroundImageView)
        setupStyle()
        addSubview(textField)
        addSubview(swapLanguageButton)
        addSubview(translateLabel)
        addSubview(targetLabel)
        addSubview(recordButton)
        addSubview(translatedLabel)
        addSubview(translateButton)
        
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
        setupConstraints()
        
    }
    private func setupStyle() {
        addSubview(stampIV)
        addSubview(tagIV)
        addSubview(tapeIV)
        NSLayoutConstraint.activate([
            stampIV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stampIV.widthAnchor.constraint(equalToConstant: 90),
            stampIV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40),
            tagIV.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            tagIV.widthAnchor.constraint(equalToConstant: 100),
            tagIV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tapeIV.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            tapeIV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30)
        ])
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            swapLanguageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            swapLanguageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            swapLanguageButton.heightAnchor.constraint(equalToConstant: 44),
            
            textField.topAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            translateButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            translateButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: -60),
            translateButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 60),
            translateButton.heightAnchor.constraint(equalTo: swapLanguageButton.heightAnchor),
            
            translatedLabel.topAnchor.constraint(equalTo: translateButton.bottomAnchor, constant: 20),
            translatedLabel.heightAnchor.constraint(equalTo: textField.heightAnchor),
            translatedLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            translatedLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            
            recordButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            recordButton.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            recordButton.trailingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 50),
            recordButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -50),
            
            translateLabel.topAnchor.constraint(equalTo: swapLanguageButton.topAnchor),
            translateLabel.bottomAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor),
            translateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            translateLabel.trailingAnchor.constraint(equalTo: swapLanguageButton.leadingAnchor, constant: -20),
        
            targetLabel.topAnchor.constraint(equalTo: swapLanguageButton.topAnchor),
            targetLabel.bottomAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor),
            targetLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            targetLabel.leadingAnchor.constraint(equalTo: swapLanguageButton.trailingAnchor, constant: 20)
            
        ])
    }
    
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }

}

