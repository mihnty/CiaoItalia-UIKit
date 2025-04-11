//
//  DialogueViewController.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 07/04/25.
//

import UIKit

class DialogueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tapButton(_ sender: UIButton) {
        print("Botão de áudio tocado dentro da viewcontroller3")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Museum.dialogue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dialogueTableView.dequeueReusableCell(
            withIdentifier: DialogueCell.identifier,
            for: indexPath) as? DialogueCell else { return UITableViewCell() }
            let dialogue = Museum.dialogue[indexPath.row]
            cell.configure(with: dialogue)

 
        //cell.selectionStyle = .none
//        cell.delegate = self
            return cell
    }
    
    

    
    lazy var dialogueTableView: UITableView = {
       let dialogueTableView = UITableView()
        dialogueTableView.translatesAutoresizingMaskIntoConstraints = false
        dialogueTableView.dataSource = self
        dialogueTableView.delegate = self
        dialogueTableView.register(DialogueCell.self, forCellReuseIdentifier: DialogueCell.identifier)
        return dialogueTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
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
        dialogueTableView.backgroundColor = .black
        dialogueTableView.rowHeight = 400
    }
    
    private func setupConstraints() {
      NSLayoutConstraint.activate([
        dialogueTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        dialogueTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        dialogueTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        dialogueTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

#Preview{
    DialogueViewController()
}
