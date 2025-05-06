//
//  ExpressionsViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//


import UIKit

class ExpressionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var expressions: [ExpressionInfo]
    
    init(expressions: [ExpressionInfo]){
        self.expressions = expressions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expressions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = expressions[indexPath.row]
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
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(expressionsTableView)
    }
    
    private func setupViewAttributes() {
        view.backgroundColor = .clear
        expressionsTableView.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            expressionsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            expressionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expressionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expressionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

#Preview {
    ExpressionsViewController(expressions: FirstWords().expressionList)
}
