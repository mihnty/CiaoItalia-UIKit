//
//  SecondController.swift
//  learninguikit
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 19/03/25.
//
import UIKit

class SecondController:UIViewController{
    override func viewDidLoad() {
        print("carregou isso")
        let label = UILabel()
        label.text = "mudou de tela"
        label.textColor = .black
        view.addSubview(label)
    }
}
