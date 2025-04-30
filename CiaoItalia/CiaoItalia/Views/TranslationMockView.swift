//
//  TranslationMockView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslationMockView:UIView {

    let recordButton: UIButton = {
        let button = UIButton(type: .system)
        let micImage = UIImage(systemName: "mic.fill")
        button.setImage(micImage, for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite ou fale algo"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let swapLanguageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PT ➡︎ EN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(recordButton)
        addSubview(textField)
        addSubview(swapLanguageButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recordButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recordButton.widthAnchor.constraint(equalToConstant: 60),
            recordButton.heightAnchor.constraint(equalToConstant: 60),
            
            textField.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            swapLanguageButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            swapLanguageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            swapLanguageButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
