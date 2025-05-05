//
//  TranslationMockView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslationView:UIView {

   
    let translateLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Italiano", textStyle: .body, textColor: .text)
        lb.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.6)
        lb.layer.cornerRadius = 10
        lb.layer.masksToBounds = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let targetLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Português", textStyle: .body, textColor: .text)
        lb.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.6)
        lb.layer.cornerRadius = 10
        lb.layer.masksToBounds = true
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
        button.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
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
        addSubview(textField)
        addSubview(swapLanguageButton)
        addSubview(translateLabel)
        addSubview(targetLabel)
        
        
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            swapLanguageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            swapLanguageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            swapLanguageButton.heightAnchor.constraint(equalToConstant: 44),
            
            textField.topAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            
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
