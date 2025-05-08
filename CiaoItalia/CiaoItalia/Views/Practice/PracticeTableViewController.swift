//
//  PracticeTableViewController.swift
//  CiaoItalia
//
//  Created by mih on 06/05/25.
//

import UIKit
class PracticeTableViewController: UIViewController {
    private let tableView = UITableView()

    private let data: [(image: String, title: String, subtitle: String, expression: Expressions)] = [
        ("italyFlag", "Primeiras Palavras", "Comece com o vocabulário essencial para se familiarizar com o idioma.", FirstWords()),
        ("italyFood", "Comer & Beber", "Palavras e expressões para se virar em restaurantes, cafés e mercados.", EatAndDrink()),
        ("italyBike", "Falsos Cognatos", "Evite mal-entendidos com essas palavras confusas.", FalseCognates()),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PracticeCardTableViewCell.self, forCellReuseIdentifier: PracticeCardTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
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

extension PracticeTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isScreenWide = UIScreen.main.bounds.width > 440
        
        return isScreenWide ? 440 : 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PracticeCardTableViewCell.identifier, for: indexPath) as? PracticeCardTableViewCell else {
            return UITableViewCell()
        }
        
        let item = data[indexPath.row]
        cell.backgroundColor = .clear
        cell.configure(
            imageName: item.image,
            title: item.title,
            subtitle: item.subtitle,
            accessibilityLabel: "Imagem relacionada a \(item.title)"
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navController = self.navigationController {
            navController.pushViewController(ExpressionsViewController(expressions: data[indexPath.row].expression), animated: true)
        } else {
            MockViewController().modalPresentationStyle = .fullScreen
            present(MockViewController(), animated: true, completion: nil)
        }
    }
}

#Preview {
    UINavigationController(rootViewController:MainPracticeViewController())
}
