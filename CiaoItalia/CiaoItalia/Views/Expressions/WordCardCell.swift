//
//  WordCardCell.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//

import UIKit


class WordCardCell: UITableViewCell {
 
    static let identifier = "WordCardCell"
    
    var italian = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .mediumGray
        text.textAlignment = .left
        
        text.numberOfLines = 0
        
        text.font = .systemFont(ofSize: 24, weight: .medium)
        return text
        
    }()
    
    private var playIcon = {
        let playIcon = UIImageView(image: UIImage(named: "dialogueSpeaker"))
        playIcon.translatesAutoresizingMaskIntoConstraints = false
        playIcon.contentMode = .scaleAspectFit
        
        return playIcon
        
    }()
    
    private var playButton = {
        let playButton = UIButton(type: .custom)
        playButton.backgroundColor = .clear
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.accessibilityHint = "Clique para reproduzir palavra"
        playButton.accessibilityLabel = "Card de palavra"
        playButton.accessibilityIdentifier = "Balão de palavra"
        playButton.accessibilityTraits = .button
        return playButton
    }()
    
    private var translation = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 0
        text.textColor = .mediumGray
        return text
    }()
    
    private var wordcard = {
       let rectangle = UIView()
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.backgroundColor = .lightBeige.withAlphaComponent(0.7)
        rectangle.layer.cornerRadius = 20
        return rectangle
    }()
    
    private var verticalstack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 18, left: 16, bottom: 18, right: 16)
        return view
    }()
    
    private var horizontalStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = .clear
        setupHierarchy()
        setupConstraints()
        setupLayout()
        setupActions()
    }
    
    func setupHierarchy() {
        contentView.addSubview(wordcard)
        wordcard.addSubview(verticalstack)
        verticalstack.addArrangedSubview(horizontalStack)
        verticalstack.addArrangedSubview(translation)
        wordcard.addSubview(playButton)
        horizontalStack.addArrangedSubview(italian)
        horizontalStack.addArrangedSubview(playIcon)
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        horizontalStack.addArrangedSubview(spacer)
    }
    
    func setupLayout() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        wordcard.layer.borderWidth = 1
        wordcard.layer.borderColor = UIColor.darkYellow.cgColor
        
        italian.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        italian.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        playIcon.setContentHuggingPriority(.required, for: .horizontal)
        playIcon.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            wordcard.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            wordcard.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            wordcard.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            wordcard.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            
            verticalstack.topAnchor.constraint(equalTo: wordcard.topAnchor),
            verticalstack.bottomAnchor.constraint(equalTo: wordcard.bottomAnchor),
            verticalstack.leadingAnchor.constraint(equalTo: wordcard.leadingAnchor),
            verticalstack.trailingAnchor.constraint(equalTo: wordcard.trailingAnchor),
            
            playButton.topAnchor.constraint(equalTo: wordcard.topAnchor),
            playButton.leadingAnchor.constraint(equalTo: wordcard.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: wordcard.trailingAnchor),
            playButton.bottomAnchor.constraint(equalTo: wordcard.bottomAnchor),
            
            playIcon.widthAnchor.constraint(equalToConstant: 24),
            playIcon.heightAnchor.constraint(equalToConstant: 24),
        ])

    }
    
    func setupActions() {
        playButton.addTarget(self, action: #selector(handlePlayButtonTapped), for: .touchUpInside)
    }
    
    @objc func handlePlayButtonTapped(_ sender: UIButton) {
        guard let text = italian.text else { return }
        SpeechManager.shared.speak(text)
    }
    
    func configure(with line: ExpressionInfo) {
        italian.text = line.italian
        let italianFont = NormalFontLabel(text: line.italian, textStyle: .title2, textColor: .mediumGray, textWeight: .semibold)
        italian.font = italianFont.font
        translation.text = line.translation
        let translationFont = NormalFontLabel(text: line.italian, textStyle: .callout, textColor: .mediumGray, textWeight: .medium)
        translation.font = translationFont.font
    }
}

#Preview {
    ExpressionsViewController(expressions: FirstWords())
}
