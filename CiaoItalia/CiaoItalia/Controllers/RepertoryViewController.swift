//
//  RepertoryViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 14/04/25.
//

import UIKit

class RepertoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SpeechManagerDelegate {
    let speechManager = SpeechManager.shared
    var whoIsSpeaking: IndexPath?
    var delegate: ContentDelegate?
    var tableView = UITableView()

    var isAudioPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        speechManager.delegate = self
        setupTableView()
        setupConstraints()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.words.count ?? 0
    }
    func changeWhoIsSpeaking(indexPath:IndexPath?) {
        self.whoIsSpeaking = indexPath
    }

    func startSpeech() {
        guard let whoIsSpeaking = whoIsSpeaking else { return }
        
        if let cell = tableView.cellForRow(at: whoIsSpeaking) as? RepertoryCardCell {
            cell.setSpeaking(value: true)
        }
    }

    func finishSpeech() {
        guard let whoIsSpeaking = whoIsSpeaking else { return }
        
        if let cell = tableView.cellForRow(at: whoIsSpeaking) as? RepertoryCardCell {
            cell.setSpeaking(value: false)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepertoryCardCell.identifier, for: indexPath) as? RepertoryCardCell else {
            return UITableViewCell()
        }
        
        guard let words = delegate?.words else {
            return UITableViewCell()
        }
        
        let word = words[indexPath.row]
        cell.configure(pt: word.portuguese, it: word.italian, imageName: word.imageName)

        cell.setPlayable(!isAudioPlaying)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        speechManager.delegate = self
        
        guard let words = delegate?.words else { return }
        let word = words[indexPath.row]
        
        speechManager.speak(word.italian, indexPath: indexPath)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(RepertoryCardCell.self, forCellReuseIdentifier: RepertoryCardCell.identifier)
        tableView.isHidden = false
    }
}
