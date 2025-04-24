//
//  DialogueCell.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 07/04/25.
//

import UIKit

class DialogueCell: UITableViewCell, SpeechManagerDelegate {
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    static let identifier = "DialogueCell"
    var italian = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .mediumGray
        text.textAlignment = .left
        
        text.numberOfLines = 0
        
        text.font = .systemFont(ofSize: 17, weight: .medium)
        return text
        
    }()
    private var arrow = {
        let arrow = UIImageView(image: UIImage(named: "dialogueTriangle"))
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    private var arrow2 = {
        let arrow = UIImageView(image: UIImage(named: "dialogueTriangle2"))
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    private lazy var playIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "dialogueSpeakerOff"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private var playButton = {
        let playButton = UIButton(type: .custom)
        playButton.backgroundColor = .clear
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.accessibilityHint = "Clique para reproduzir diálogo"
        playButton.accessibilityLabel = "Balão de diálogo"
        playButton.accessibilityIdentifier = "Balão de diálogo"
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
    private var dialoguebox = {
       let rectangle = UIView()
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.backgroundColor = .lightBeige
        rectangle.layer.cornerRadius = 12
        
        
        rectangle.layer.shadowColor = UIColor.darkGolden.cgColor
        rectangle.layer.shadowOpacity = 1
        rectangle.layer.shadowOffset = CGSize(width: 0, height: 4)
        rectangle.layer.shadowRadius = 0.1
        rectangle.layer.masksToBounds = false
        return rectangle
    }()
    
    private var dialoguebox2 = {
       let rectangle = UIView()
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.backgroundColor = .lightBeige
        rectangle.layer.cornerRadius = 12
        
        
        rectangle.layer.shadowColor = UIColor.lightYellow.cgColor
        rectangle.layer.shadowOpacity = 1
        rectangle.layer.shadowOffset = CGSize(width: 0, height: -4)
        rectangle.layer.shadowRadius = 0.1
        rectangle.layer.masksToBounds = false
        return rectangle
    }()
    
    private var verticalstack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    private var dialoguestack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 16
        
        return view
    }()

        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        SpeechManager.shared.delegate = self
        setup()
        
    }
    
    private var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        self.backgroundColor = .clear
        setupHierarchy()
        setupConstraints()
        setupLayout()
        setupActions()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(arrow)
        contentView.addSubview(arrow2)
        contentView.addSubview(verticalstack)
        verticalstack.addArrangedSubview(container)
        contentView.addSubview(translation)
        dialoguestack.addArrangedSubview(playIcon)
        container.addSubview(dialoguebox)
        container.addSubview(dialoguebox2)
        container.addSubview(dialoguestack)
        container.addSubview(playButton)
    }

    private func setupLayout() {
        contentView.backgroundColor = .clear
        self.selectionStyle = .none
    }

    private func setupConstraints() {
        leadingConstraint = verticalstack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        trailingConstraint = verticalstack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        NSLayoutConstraint.activate([
            verticalstack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            verticalstack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalstack.widthAnchor.constraint(equalToConstant: 252),

            arrow2.leadingAnchor.constraint(equalTo: verticalstack.trailingAnchor, constant: -14),
            arrow2.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),

            container.centerYAnchor.constraint(equalTo: verticalstack.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: verticalstack.centerXAnchor),

            dialoguebox.topAnchor.constraint(equalTo: verticalstack.topAnchor),
            dialoguebox.bottomAnchor.constraint(equalTo: translation.topAnchor, constant: -20),

            dialoguebox2.topAnchor.constraint(equalTo: dialoguebox.topAnchor),
            dialoguebox2.leadingAnchor.constraint(equalTo: dialoguebox.leadingAnchor),
            dialoguebox2.trailingAnchor.constraint(equalTo: dialoguebox.trailingAnchor),
            dialoguebox2.heightAnchor.constraint(equalTo: dialoguebox.heightAnchor),

            dialoguestack.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),
            dialoguestack.leadingAnchor.constraint(equalTo: dialoguebox2.leadingAnchor, constant: 16),
            dialoguestack.bottomAnchor.constraint(equalTo: dialoguebox2.bottomAnchor, constant: -8),
            dialoguestack.trailingAnchor.constraint(equalTo: dialoguebox2.trailingAnchor, constant: -16),

            playButton.topAnchor.constraint(equalTo: dialoguebox.topAnchor),
            playButton.leadingAnchor.constraint(equalTo: dialoguebox.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: dialoguebox.trailingAnchor),
            playButton.heightAnchor.constraint(equalTo: dialoguebox.heightAnchor),

            dialoguebox.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),

            italian.widthAnchor.constraint(equalToConstant: 172.0),

            translation.topAnchor.constraint(equalTo: dialoguebox.bottomAnchor, constant: 20),
            translation.leadingAnchor.constraint(equalTo: verticalstack.leadingAnchor, constant: 4),
            translation.trailingAnchor.constraint(equalTo: verticalstack.trailingAnchor, constant: -4),
            translation.bottomAnchor.constraint(equalTo: verticalstack.bottomAnchor, constant: -18),

            arrow.leadingAnchor.constraint(equalTo: verticalstack.leadingAnchor, constant: -12),
            arrow.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),
        ])

        trailingConstraint?.isActive = true
    }

    private func setupActions() {
        playButton.addTarget(self, action: #selector(handlePlayButtonTapped), for: .touchUpInside)
    }

    @objc private func handlePlayButtonTapped() {
        guard let text = italian.text, !text.isEmpty else { return }
        playIcon.image = UIImage(named: "dialogueSpeaker")
        SpeechManager.shared.speak(text)
    }

    func startSpeech() {
        
    }

    func finishSpeech() {
        DispatchQueue.main.async {
            self.playIcon.image = UIImage(named: "dialogueSpeakerOff")
        }
    }

    func changeWhoIsSpeaking(indexPath: IndexPath) {
        
    }

    func configure(with line: DialogueLine) {
        italian.text = line.italian
        let italianFont = NormalFontLabel(text: line.italian, textStyle: .body, textColor: .mediumGray, textWeight: .medium)
        italian.font = italianFont.font
        translation.text = line.translation
        let translationFont = NormalFontLabel(text: line.italian, textStyle: .callout, textColor: .mediumGray, textWeight: .medium)
        translation.font = translationFont.font
        arrow.isHidden = true
        arrow2.isHidden = true

                
            dialoguestack.arrangedSubviews.forEach { dialoguestack.removeArrangedSubview($0); $0.removeFromSuperview() }

            if line.type == .question {
                verticalstack.alignment = .leading
                dialoguestack.alignment = .center
                dialoguestack.addArrangedSubview(playIcon)
                dialoguestack.addArrangedSubview(italian)
                trailingConstraint?.isActive = true
                leadingConstraint?.isActive = false
                dialoguebox.backgroundColor = .lightBeige
                dialoguebox2.backgroundColor = .lightBeige
                arrow2.isHidden = false
            } else {
                verticalstack.alignment = .trailing
                dialoguestack.alignment = .center
                dialoguestack.addArrangedSubview(italian)
                dialoguestack.addArrangedSubview(playIcon)
                trailingConstraint?.isActive = false
                leadingConstraint?.isActive = true
                dialoguebox.backgroundColor = .darkBeige
                dialoguebox2.backgroundColor = .darkBeige
                arrow.isHidden = false
            }
   }
    

    
    

}


#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}

