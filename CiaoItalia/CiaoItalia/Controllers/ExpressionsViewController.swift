//
//  ExpressionsViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 06/05/25.
//


import UIKit

class ExpressionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var dialogue:[DialogueItem]
    
    init(dialogue: [DialogueItem]){
        self.dialogue = dialogue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dialogue.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = dialogue[indexPath.row]
        
        
    
        
        
        
        guard let cell = expressionsTableView.dequeueReusableCell(withIdentifier: WordCardCell.identifier, for: indexPath ) as? WordCardCell else {
                return UITableViewCell()
                
            }
        
        switch(line){
            
        case .dialogue(let line):
            
            cell.configure(with: line)
        default :
            return UITableViewCell()
        }
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
    
     // MARK: - Navigation

    
}

//#Preview{
//    UINavigationController(rootViewController: CarouselContainerViewController())
//}

#Preview{
    ExpressionsViewController(dialogue:     HotelCheckin().dialogue)
}
