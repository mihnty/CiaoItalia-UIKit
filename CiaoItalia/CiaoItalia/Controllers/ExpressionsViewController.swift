//
//  ExpressionsViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//


import UIKit

class ExpressionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var expressions: Expressions
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mediumGray
        label.textAlignment = .left
        return label
    }()
    
    init(expressions: Expressions){
        self.expressions = expressions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expressions.expressionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = expressions.expressionList[indexPath.row]
        guard let cell = expressionsTableView.dequeueReusableCell(withIdentifier: WordCardCell.identifier, for: indexPath ) as? WordCardCell else {
            return UITableViewCell()
        }
        cell.configure(with: line)
        return cell
    }
    
    lazy var expressionsTableView: UITableView = {
        let expressionsTableView = UITableView()
        expressionsTableView.translatesAutoresizingMaskIntoConstraints = false
        expressionsTableView.dataSource = self
        expressionsTableView.delegate = self
        expressionsTableView.register(WordCardCell.self, forCellReuseIdentifier: WordCardCell.identifier)
        return expressionsTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    private func setup(){
        setupTitle()
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
    }
    
    private func setupTitle() {
        let titleFont = FuzzyFontLabel(text: expressions.title, textStyle: .title1)
        titleLabel.font = titleFont.font
        titleLabel.text = expressions.title
    }
    
    private func setupViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(expressionsTableView)
    }
    
    private func setupViewAttributes() {
        view.backgroundColor = .clear
        expressionsTableView.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            expressionsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            expressionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expressionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expressionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

#Preview {
    ExpressionsViewController(expressions: FirstWords())
}
