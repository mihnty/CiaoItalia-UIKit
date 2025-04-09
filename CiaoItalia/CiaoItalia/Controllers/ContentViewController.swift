//
//  ContentViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 08/04/25.
//
import UIKit

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
        print("selecionou a palavra \(word.italian)")
        speechManager.speak(word.italian, indexPath:indexPath)
      
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

#Preview {
    MyView()
}
