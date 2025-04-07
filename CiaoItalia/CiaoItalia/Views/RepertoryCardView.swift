//
//  RepertoryCardView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//

import UIKit

class RepertoryCardView: UIView {
    private let image = UIImageView()
    private let portuguese = UILabel()
    private let italian = UILabel()
    init(frame:CGRect, pt:String, it:String, imageName:String) {
        super.init(frame: frame)
        setupImage(imageName:imageName)
        setupLabels(pt:pt, it:it)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    func setupImage(imageName:String) {
        self.image.image = UIImage(named: imageName)
        self.image.contentMode = .scaleAspectFit
        self.image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.image)
    }
    func setupLabels(pt:String, it:String) {
        self.portuguese.text = pt
        self.portuguese.textColor = .blue
        self.portuguese.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.portuguese)
        self.italian.text = it
        self.italian.textColor = .blue
        self.italian.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.italian)
    }
   
    func setupConstraints(){
        NSLayoutConstraint.activate([
            self.image.topAnchor.constraint(equalTo: self.topAnchor),
            self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.italian.topAnchor.constraint(equalTo: self.image.topAnchor),
            self.italian.leadingAnchor.constraint(equalTo: self.image.trailingAnchor),
            self.portuguese.topAnchor.constraint(equalTo: self.italian.bottomAnchor),
            self.portuguese.leadingAnchor.constraint(equalTo: self.italian.leadingAnchor),
            self.image.widthAnchor.constraint(equalToConstant: 80.0),
            self.image.heightAnchor.constraint(equalToConstant: 100.0),
            self.image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
        ])
    }
    func configure(it:String, pt:String, imageName:String) {
        setupImage(imageName:imageName)
        setupLabels(pt:pt, it:it)
        setupConstraints()
    }
}

class RepertoryCardCell: UITableViewCell {
    static let identifier = "RepertoryCardCell"
    let cardView = RepertoryCardView(frame: .zero, pt: "Café", it: "Caffè", imageName: "coffee")
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
    func configure(pt: String, it: String, imageName: String) {
        cardView.configure(it: it, pt: pt, imageName: imageName)
    }
}

class MyView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()
    let items = Food.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepertoryCardCell.identifier, for: indexPath) as? RepertoryCardCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configure(pt: item.portuguese, it: item.italian, imageName: item.imageName)
        return cell
    }
}

#Preview {
    MyView()
}
