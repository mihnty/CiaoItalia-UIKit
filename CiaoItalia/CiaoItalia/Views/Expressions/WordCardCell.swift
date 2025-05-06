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
        rectangle.backgroundColor = .lightBeige
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
    
    private var horizontalstack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 5
        
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
        verticalstack.addArrangedSubview(horizontalstack)
        verticalstack.addArrangedSubview(translation)
        wordcard.addSubview(playButton)
        horizontalstack.addArrangedSubview(italian)
        horizontalstack.addArrangedSubview(playIcon)
        

        
        

    }
    
    
    
    
    func setupLayout() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        wordcard.layer.borderWidth = 1
        wordcard.layer.borderColor = UIColor.darkYellow.cgColor
    }
    
    func setupConstraints(){

       
        NSLayoutConstraint.activate([
            
            wordcard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            wordcard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            wordcard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            wordcard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            
            verticalstack.topAnchor.constraint(equalTo: wordcard.topAnchor),
            verticalstack.bottomAnchor.constraint(equalTo: wordcard.bottomAnchor),
            verticalstack.leadingAnchor.constraint(equalTo: wordcard.leadingAnchor),
            verticalstack.trailingAnchor.constraint(equalTo: wordcard.trailingAnchor),
            
            playButton.topAnchor.constraint(equalTo: wordcard.topAnchor),
            playButton.leadingAnchor.constraint(equalTo: wordcard.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: wordcard.trailingAnchor),
            playButton.bottomAnchor.constraint(equalTo: wordcard.bottomAnchor),
        

        ])

    }
    
    func setupActions() {
        playButton.addTarget(self, action: #selector(handlePlayButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func handlePlayButtonTapped(_ sender: UIButton) {
        guard let text = italian.text else { return }
        SpeechManager.shared.speak(text)
    }
    

    
    func configure(with line: DialogueLine) {
        italian.text = line.italian
        let italianFont = NormalFontLabel(text: line.italian, textStyle: .title2, textColor: .mediumGray, textWeight: .semibold)
        italian.font = italianFont.font
        translation.text = line.translation
        let translationFont = NormalFontLabel(text: line.italian, textStyle: .callout, textColor: .mediumGray, textWeight: .medium)
        translation.font = translationFont.font
        
        
        
    }
    
    

}

//#Preview {
//    let cell  = WordCardCell()
//    cell.configure(with: DialogueLine(italian: "AAAAAAAA", translation: "BBBBBBBB", type: .answer))
//    return cell
//}

#Preview {
    ExpressionsViewController(dialogue: HotelCheckin().dialogue)
}
