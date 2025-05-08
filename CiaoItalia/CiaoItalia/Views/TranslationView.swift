//
//  TranslationMockView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslationView:UIView {
    
    let isScreenWide = UIScreen.main.bounds.width > 440
    
    lazy var translateLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Português", textStyle: .body, textColor: .text)
        lb.backgroundColor = UIColor(named: "darkBeige")
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
        bt.backgroundColor = UIColor(named: "darkBeige")
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
        lb.backgroundColor = UIColor(named: "darkBeige")
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
    
    private let backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
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
    
    private lazy var detailsImageView: UIImageView = {
        return self.makeImageView(named: "titleDetails")
    }()
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var titleLabel: UILabel = {
        let label = FuzzyFontLabel(text: "Tradução", textStyle: .largeTitle, textColor: .lightGrayText)
        return label
    }()
    
    private func makeImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    
    public let recordButton: UIButton = {
        let btn = UIButton(type: .custom)
        let micImage = UIImage(systemName: "microphone.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))?.withTintColor(.darkYellow, renderingMode: .alwaysOriginal)
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
        self.addSubview(scribbleImageView1)
        self.addSubview(scribbleImageView2)
        self.addSubview(sealImageView)
        self.addSubview(mammaImageView)
        self.addSubview(tapeImageView)
        self.addSubview(tagImageView)
        
        titleLabel = FuzzyFontLabel(text: "Diário de Viagem", textStyle: isScreenWide ? .extraLargeTitle : .largeTitle, textColor: .lightGrayText)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(detailsImageView)
        self.addSubview(titleStackView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -32),
            
            sealImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            sealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            
            tapeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -4),
            tapeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            
            mammaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            
            detailsImageView.widthAnchor.constraint(equalToConstant: 50),
            
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
            recordButton.widthAnchor.constraint(equalToConstant: 70),
            recordButton.heightAnchor.constraint(equalToConstant: 70),
           
            
            translateLabel.topAnchor.constraint(equalTo: swapLanguageButton.topAnchor),
            translateLabel.bottomAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor),
            translateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            translateLabel.trailingAnchor.constraint(equalTo: swapLanguageButton.leadingAnchor, constant: -20),
        
            targetLabel.topAnchor.constraint(equalTo: swapLanguageButton.topAnchor),
            targetLabel.bottomAnchor.constraint(equalTo: swapLanguageButton.bottomAnchor),
            targetLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            targetLabel.leadingAnchor.constraint(equalTo: swapLanguageButton.trailingAnchor, constant: 20)
            
        ])
        
        if (isScreenWide) {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: self.topAnchor),
                scribbleImageView1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                
                scribbleImageView2.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                scribbleImageView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 70),
                
                tagImageView.widthAnchor.constraint(equalToConstant: 400),
                tagImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
                
                mammaImageView.widthAnchor.constraint(equalToConstant: 230),
                mammaImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 400),
                
                sealImageView.widthAnchor.constraint(equalToConstant: 300),
                
                titleStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                titleStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 130)

            ])
        } else {
            NSLayoutConstraint.activate([
                scribbleImageView1.topAnchor.constraint(equalTo: self.topAnchor, constant: -140),
                scribbleImageView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -140),
                
                scribbleImageView2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 140),
                scribbleImageView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 140),
                
                tagImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -55),

                mammaImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
                
                tapeImageView.widthAnchor.constraint(equalToConstant: 200),
                
                
                titleStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                titleStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20)

            ])
        }
    }
    
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }

}

