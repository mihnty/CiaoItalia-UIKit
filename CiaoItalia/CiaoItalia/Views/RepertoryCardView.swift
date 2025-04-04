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
        setupView(imageName:imageName)
        setupLabels(pt:pt, it:it)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    func setupView(imageName:String) {
        self.image.image = UIImage(named: imageName)
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
        
    }
}

