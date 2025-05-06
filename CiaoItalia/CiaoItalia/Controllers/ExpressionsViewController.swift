//
//  ExpressionsViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//


import UIKit

class ExpressionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var expressions: Expressions
    var filteredExpressions: [ExpressionInfo]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .mediumGray
        label.textAlignment = .left
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        return searchBar
    }()
    
    init(expressions: Expressions){
        self.expressions = expressions
        self.filteredExpressions = expressions.expressionList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredExpressions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let line = filteredExpressions[indexPath.row]
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
    
    private func setup() {
        setupTitle()
        setupSearchBar()
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
    }
    
    private func setupTitle() {
        let titleFont = FuzzyFontLabel(text: expressions.title, textStyle: .title1)
        titleLabel.font = titleFont.font
        titleLabel.text = expressions.title
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
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
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            expressionsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            expressionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            expressionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            expressionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredExpressions = expressions.expressionList
        } else {
            filteredExpressions = expressions.expressionList.filter { line in
                return line.italian.lowercased().contains(searchText.lowercased())
            }
        }
        expressionsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


#Preview {
    ExpressionsViewController(expressions: FirstWords())
}
