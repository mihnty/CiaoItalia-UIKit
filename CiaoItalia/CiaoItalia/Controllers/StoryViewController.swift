//
//  ContentViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 08/04/25.
//
import UIKit

class StoryViewController: UIViewController, SpeechManagerDelegate {
    var headerImage = UIImageView()
    let tableView = UITableView()
    let speechManager = SpeechManager.shared
    var whoIsSpeaking:IndexPath?
    var words: [any ContentType] = []
    let segmentedControl = UISegmentedControl(items: ["Repertório", "Diálogo"])
    let backgroundImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "backgroundPattern"))
    }()
    init(content:[any ContentType]) {
        super.init(nibName: nil, bundle: nil)
        self.words = content
        if let header = content.first?.header {
            print(header)
            headerImage.image = UIImage(named: header)
        } else {
            print("content está vazio")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        speechManager.delegate = self
        view.addSubview(backgroundImageView)
        view.addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        setupTableView()
        setupSegmentedControl()
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            headerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
    func setupSegmentedControl(){
        self.segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGray6.withAlphaComponent(0.8)
        segmentedControl.selectedSegmentTintColor =  UIColor(named: "background")
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
    }
    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(RepertoryCardCell.self, forCellReuseIdentifier: RepertoryCardCell.identifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func changeWhoIsSpeaking(indexPath:IndexPath) {
        self.whoIsSpeaking = indexPath
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
extension StoryViewController:UITableViewDelegate, UITableViewDataSource {
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
        print("selecionou a palavra \(word.italian)")
        speechManager.speak(word.italian, indexPath:indexPath)
      
    }
}
#Preview {
    StoryViewController(content:Food.allCases)
}
