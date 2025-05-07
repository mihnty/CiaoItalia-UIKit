//
//  DialogueCell.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 07/04/25.
//

import UIKit

class DialogueCell: UITableViewCell {
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    static let identifier = "DialogueCell"
    var isAudioPlaying: Bool = false

    private lazy var italian: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .mediumGray
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 17, weight: .medium)
        return lbl
    }()

    private lazy var arrow: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "dialogueTriangle"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var arrow2: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "dialogueTriangle2"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var playIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "dialogueSpeakerOff"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private lazy var playButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.accessibilityHint = "Clique para reproduzir diálogo"
        btn.accessibilityLabel = "Balão de diálogo"
        btn.accessibilityIdentifier = "Balão de diálogo"
        btn.accessibilityTraits = .button
        return btn
    }()

    private lazy var translation: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.textColor = .mediumGray
        return lbl
    }()

    private lazy var dialoguebox: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightBeige
        v.layer.cornerRadius = 12
        v.layer.shadowColor = UIColor.darkGolden.cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: 4)
        v.layer.shadowRadius = 0.1
        return v
    }()

    private lazy var dialoguebox2: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightBeige
        v.layer.cornerRadius = 12
        v.layer.shadowColor = UIColor.lightYellow.cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: -4)
        v.layer.shadowRadius = 0.1
        return v
    }()

    private lazy var verticalstack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        return sv
    }()

    private lazy var dialoguestack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 16
        return sv
    }()

    private lazy var container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
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
        selectionStyle = .none
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

            playIcon.widthAnchor.constraint(equalToConstant: 24),
            playIcon.heightAnchor.constraint(equalToConstant: 24)
        ])

        trailingConstraint?.isActive = true
    }

    private func setupActions() {
        playButton.addTarget(self, action: #selector(handlePlayButtonTapped), for: .touchUpInside)
    }
    
    
//    @objc func handlePlayButtonTapped(_ sender: UIButton) {
//        guard let text = italian.text else { return }
//        SpeechManager.shared.speak(text)
//    }
    
    func stopAudio(){
        SpeechManager.shared.stop()
    }
    

    @objc private func handlePlayButtonTapped() {
        guard let text = italian.text, !text.isEmpty else { return }
        setSpeakingOn()
        var view: UIView? = self
        while view != nil, !(view is UITableView) { view = view?.superview }
        if let table = view as? UITableView,
           let ip = table.indexPath(for: self) {
            SpeechManager.shared.speak(text, indexPath: ip)
        } else {
            SpeechManager.shared.speak(text)
        }
    }

    func setSpeakingOn() {
        playIcon.image = UIImage(named: "dialogueSpeaker")
    }
    func setSpeakingOff() {
        playIcon.image = UIImage(named: "dialogueSpeakerOff")
    }
    func setPlayable(_ yes: Bool) {
        playButton.isEnabled = yes
    }

    func configure(with line: DialogueLine) {
        italian.text = line.italian
        setSpeakingOff()
        setPlayable(true)
        let italianFont = NormalFontLabel(text: line.italian, textStyle: .body, textColor: .mediumGray, textWeight: .medium)
        italian.font = italianFont.font
        translation.text = line.translation
        let translationFont = NormalFontLabel(text: line.translation, textStyle: .callout, textColor: .mediumGray, textWeight: .regular)
        translation.font = translationFont.font
        arrow.isHidden = true
        arrow2.isHidden = true

        dialoguestack.arrangedSubviews.forEach {
            dialoguestack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

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
