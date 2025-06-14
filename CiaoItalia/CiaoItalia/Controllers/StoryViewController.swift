//
//  ContentViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 08/04/25.
//
import UIKit

class StoryViewController: UIViewController, ContentDelegate {
    lazy var headerImage = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var repertoryLabel = {
        let lb = NormalFontLabel(text: "Repertório:", textStyle: .body, textColor: UIColor(named: "textColor") ?? .brown, textWeight: .bold)
        return lb
    }()
    lazy var repertoryVC = RepertoryViewController()
    lazy var dialogueVC = DialogueViewController(dialogue: [])
    
    var words: [any ContentType] = []
    lazy var segmentedControl = UISegmentedControl(items: ["Repertório", "Diálogo"])
    
    var isAudioPlaying = false

    lazy var backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
    }()
    
    init(content:[any ContentType]) {
        super.init(nibName: nil, bundle: nil)
        self.words = content
        if let header = content.first?.header, let title = content.first?.title, let accessibility = content.first?.headerAcessibilityHint, let dialogue = content.first?.dialogue {
            headerImage.image = UIImage(named: header)
            headerImage.accessibilityLabel = accessibility
            headerImage.isAccessibilityElement = true
            dialogueVC.dialogue = dialogue
            titleLabel = FuzzyFontLabel(text: title, textStyle: .largeTitle)
        } else {
            print("content está vazio")
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor(named:"textColor")
        view.backgroundColor = UIColor(named: "background")

        setupView()
        repertoryVC.didMove(toParent: self)
        setupConstraints()

        repertoryVC.isAudioPlaying = isAudioPlaying
        dialogueVC.isAudioPlaying = isAudioPlaying
    }

    func setupConstraints() {
        dialogueVC.view.isHidden = true
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: headerImage.bottomAnchor),
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            repertoryLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5),
            repertoryLabel.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor, constant: 5),
            repertoryVC.view.topAnchor.constraint(equalTo: repertoryLabel.bottomAnchor),
            repertoryVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            repertoryVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            repertoryVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dialogueVC.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            dialogueVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dialogueVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dialogueVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        repertoryVC.setupConstraints()
    }

    func setupView(){
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)

        headerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImage)

        repertoryVC.delegate = self
        repertoryVC.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(repertoryVC)
        view.addSubview(repertoryVC.view)

        dialogueVC.view.translatesAutoresizingMaskIntoConstraints = false
        dialogueVC.view.isHidden = true
        addChild(dialogueVC)
        view.addSubview(dialogueVC.view)

        repertoryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repertoryLabel)

        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGray6.withAlphaComponent(0.2)
        segmentedControl.selectedSegmentTintColor =  UIColor(named: "background")
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(changeTableView(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)

        titleLabel.textColor = UIColor(named: "textColor")
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
    }

//    @objc func changeTableView(_ sender: UISegmentedControl) {
    
    @objc func changeTableView(_ sender:UISegmentedControl){
        SpeechManager.shared.stop()
        Task {
            await SpeechManager.shared.synthesizer.stop()
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            repertoryVC.view.isHidden = false
            repertoryLabel.isHidden = false
            dialogueVC.view.isHidden = true
            SpeechManager.shared.delegate = repertoryVC
        case 1:
            repertoryVC.view.isHidden = true
            repertoryLabel.isHidden = true
            dialogueVC.view.isHidden = false
            dialogueVC.reloadAllCells(reset: true)
            SpeechManager.shared.delegate = dialogueVC
        default:
            print("Algo deu errado")
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

#Preview {
    UINavigationController(rootViewController: CarouselContainerViewController())
}
