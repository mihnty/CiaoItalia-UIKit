//
//  DialogueViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 07/04/25.
//

import UIKit

class DialogueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
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
        
        let dialogue = dialogue[indexPath.row]
        
        switch(dialogue){
        case .title(let text):
            guard let cell = dialogueTableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath ) as? TitleCell else {
                return UITableViewCell()
                
            }
            cell.configure(with: text)
            return cell
        case .dialogue(let line):
            guard let cell = dialogueTableView.dequeueReusableCell(withIdentifier: DialogueCell.identifier, for: indexPath ) as? DialogueCell else {
                return UITableViewCell()
                
            }
            cell.configure(with: line)
            return cell
            
        case .end(let text):
            guard let cell = dialogueTableView.dequeueReusableCell(withIdentifier: EndCell.identifier, for: indexPath ) as? EndCell else {
                return UITableViewCell()
                
            }
            cell.configure(with: text)
            return cell
            }
    }
    
    
    
    
    lazy var dialogueTableView: UITableView = {
        let dialogueTableView = UITableView()
        dialogueTableView.translatesAutoresizingMaskIntoConstraints = false
        dialogueTableView.dataSource = self
        dialogueTableView.delegate = self
        dialogueTableView.register(DialogueCell.self, forCellReuseIdentifier: DialogueCell.identifier)
        dialogueTableView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        dialogueTableView.register(EndCell.self, forCellReuseIdentifier: EndCell.identifier)
        return dialogueTableView
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
        view.addSubview(dialogueTableView)
    }
    
    private func setupViewAttributes() {
        view.backgroundColor = .clear
        dialogueTableView.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dialogueTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            dialogueTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dialogueTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dialogueTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
     // MARK: - Navigation

    
}

#Preview{
    UINavigationController(rootViewController: CarouselContainerViewController())
}
