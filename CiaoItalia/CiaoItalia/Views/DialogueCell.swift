//
//  DialogueCell.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 07/04/25.
//

import UIKit

protocol DialogueCellDelegate: AnyObject {
    func tapButton(_ sender: UIButton)
}

class DialogueCell: UITableViewCell {
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    static let identifier = "DialogueCell"
    var italian = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
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
    
    private var playButton = {
        let playButton = UIButton(type: .custom)
        playButton.setImage(UIImage(named: "dialogueSpeaker"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    private var buttonTeste = {
        let button = UIButton(type: .system)
        button.setTitle("Teste", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var translation = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = .systemFont(ofSize: 16, weight: .medium)
        text.numberOfLines = 0
        text.textColor = .black
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
        view.spacing = 8
        return view
    }()
    
    weak var delegate: DialogueCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        
    }
    
    private var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var action: (() -> Void)?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        setupHierarchy()
        setupConstraints()
        setupLayout()
        setupActions()
    }
    
    func setupHierarchy() {
        self.addSubview(arrow)
        self.addSubview(arrow2)
        self.addSubview(verticalstack)
        verticalstack.addArrangedSubview(container)
        verticalstack.addArrangedSubview(translation)
        container.addSubview(dialoguebox)
        container.addSubview(dialoguebox2)
        container.addSubview(dialoguestack)
        dialoguestack.addArrangedSubview(buttonTeste)
        
        

    }
    
    
    
    
    func setupLayout() {
            
         
            
         
    }
    
    func setupConstraints(){
        
        leadingConstraint = verticalstack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        trailingConstraint = verticalstack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
       
        NSLayoutConstraint.activate([
            
            verticalstack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 4),
            verticalstack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            verticalstack.widthAnchor.constraint(equalToConstant: 252),
            verticalstack.heightAnchor.constraint(equalToConstant: 168),
            
            arrow2.leadingAnchor.constraint(equalTo: verticalstack.trailingAnchor, constant: -14),
            arrow2.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),
            
            container.centerYAnchor.constraint(equalTo: verticalstack.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: verticalstack.centerXAnchor),
            
            
            dialoguestack.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),
            dialoguestack.leadingAnchor.constraint(equalTo: dialoguebox2.leadingAnchor, constant: 16),
            dialoguestack.bottomAnchor.constraint(equalTo: dialoguebox2.bottomAnchor, constant: -8),
            dialoguestack.trailingAnchor.constraint(equalTo: dialoguebox2.trailingAnchor, constant: -8),

            dialoguebox2.topAnchor.constraint(equalTo: dialoguebox.topAnchor),
            dialoguebox2.leadingAnchor.constraint(equalTo: dialoguebox.leadingAnchor),
            dialoguebox2.trailingAnchor.constraint(equalTo: dialoguebox.trailingAnchor),
            dialoguebox2.heightAnchor.constraint(equalTo: dialoguebox.heightAnchor),
//
            dialoguebox.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
//
            italian.widthAnchor.constraint(equalToConstant: 172.0),
        
            translation.topAnchor.constraint(equalTo: container.bottomAnchor, constant: -4),
            translation.leadingAnchor.constraint(equalTo: verticalstack.leadingAnchor),
            translation.trailingAnchor.constraint(equalTo: verticalstack.trailingAnchor),
            
            arrow.leadingAnchor.constraint(equalTo: verticalstack.leadingAnchor, constant: -12),
            arrow.topAnchor.constraint(equalTo: dialoguebox2.topAnchor, constant: 8),
            //playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        ])
        //self.bringSubviewToFront(playButton)
        trailingConstraint?.isActive = true
    }
    
    func setupActions() {
        print("eae ner??")
        playButton.addTarget(self, action: #selector(handlePlayButtonTapped), for: .touchUpInside)
        print("abdkasjh")
        buttonTeste.addTarget(self, action: #selector(teste), for: .touchUpInside)
    }
    
    @objc func teste(){
        print("toquei")
    }
    
    @objc func handlePlayButtonTapped(_ sender: UIButton) {
        print("tocado dentro da celula")
        action?()
        delegate?.tapButton(sender)
        print("Botão de áudio tocado!")
        guard let text = italian.text else { return }
        SpeechManager.shared.speak(text)
        
        
    }
    

    
    func configure(with line: DialogueLine) {
        italian.text = line.italian
        translation.text = line.translation
        arrow.isHidden = true
        arrow2.isHidden = true

                
        // Limpa a stack antes de reconfigurar
            dialoguestack.arrangedSubviews.forEach { dialoguestack.removeArrangedSubview($0); $0.removeFromSuperview() }

            if line.type == .question {
                verticalstack.alignment = .leading
                dialoguestack.alignment = .center
                dialoguestack.addArrangedSubview(playButton)
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
                dialoguestack.addArrangedSubview(playButton)
                trailingConstraint?.isActive = false
                leadingConstraint?.isActive = true
                dialoguebox.backgroundColor = .darkBeige
                dialoguebox2.backgroundColor = .darkBeige
                arrow.isHidden = false
            }
   }
    

    
    

}

#Preview {
    DialogueCell()
}

