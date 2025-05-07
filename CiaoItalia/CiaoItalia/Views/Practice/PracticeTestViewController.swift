//
//  PracticeTestViewController.swift
//  CiaoItalia
//
//  Created by mih on 06/05/25.
//

import UIKit
class PracticeTestViewController: UIViewController {
    
    private let data: [(image: String, title: String, subtitle: String)] = [
        ("italyFlag", "Primeiras Palavras", "Comece com o vocabulário essencial para se familiarizar com o idioma."),
        ("italyFood", "Comer & Beber", "Palavras e expressões para se virar em restaurantes, cafés e mercados."),
        ("italyBike", "Falsos Cognatos", "Evite mal-entendidos com essas palavras confusas."),
    ]

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PracticeCardTableViewCell.self, forCellReuseIdentifier: PracticeCardTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension PracticeTestViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: PracticeCardTableViewCell.identifier, for: indexPath) as? PracticeCardTableViewCell else {
            return UITableViewCell()
        }

        let item = data[indexPath.row]
        cell.configure(
            imageName: item.image,
            title: item.title,
            subtitle: item.subtitle,
            accessibilityLabel: "Imagem relacionada a \(item.title)"
        )

        return cell
    }
}

#Preview {
    PracticeTestViewController()
}
