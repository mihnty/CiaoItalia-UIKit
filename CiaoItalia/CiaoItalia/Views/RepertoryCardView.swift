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

class RepertoryCardCell: UITableViewCell {
    static let identifier = "RepertoryCardCell"
    let cardView = RepertoryCardView(frame: .zero, pt: "Café", it: "Caffè", imageName: "coffee")
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSpeaking() {
        cardView.isSpeaking.toggle()
    }
    func setupCardView(){
        contentView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        cardView.layer.cornerRadius = 12
        cardView.clipsToBounds = true
        cardView.layer.borderWidth = 2.0
        cardView.layer.borderColor = UIColor(named: "textColor")?.cgColor
    }
    func configure(pt: String, it: String, imageName: String) {
        cardView.configure(it: it, pt: pt, imageName: imageName)
    }
}

class MyView: UIViewController, UITableViewDataSource, UITableViewDelegate, SpeechManagerDelegate {
    let tableView = UITableView()
    //passar pela view inicial
    let words = Train.allCases
    let speechManager = SpeechManager.shared
    var whoIsSpeaking:IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        speechManager.delegate = self
        setupTableView()
    }
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.register(RepertoryCardCell.self, forCellReuseIdentifier: RepertoryCardCell.identifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepertoryCardCell.identifier, for: indexPath) as? RepertoryCardCell else {
            return UITableViewCell()
        }
        let word = words[indexPath.row]
        cell.configure(pt: word.portuguese, it: word.italian, imageName: word.imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = words[indexPath.row]
        self.whoIsSpeaking = indexPath
        print("selecionou a palavra \(word.italian)")
        speechManager.speak(word.italian)
        
    }
    func startSpeech() {
        guard let whoIsSpeaking = whoIsSpeaking else {
            return
        }
        if let cell = tableView.cellForRow(at: whoIsSpeaking) as? RepertoryCardCell {
            cell.setSpeaking()
        }
    }
    func finishSpeech() {
        guard let whoIsSpeaking = whoIsSpeaking else {
            return
        }
        if let cell = tableView.cellForRow(at: whoIsSpeaking) as? RepertoryCardCell {
            cell.setSpeaking()
        }
    }
    
}

#Preview {
    MyView()
}
