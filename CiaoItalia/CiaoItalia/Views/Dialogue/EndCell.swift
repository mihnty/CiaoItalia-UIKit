//
//  TitleCell.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 15/04/25.
//

import UIKit

class EndCell: UITableViewCell {
    
    static var identifier = "EndCell"

    let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .mediumGray
            label.textAlignment = .center
            return label
        }()
    
    func setup(){
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setupHierarchy()
        setupConstraints()
        
    }
    func setupHierarchy(){
        
        contentView.addSubview(label)
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
          
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    func configure(with text: String) {
        let titleFont = FuzzyFontLabel(text: text, textStyle: .title1)
        label.font = titleFont.font
        label.text = text
        
        
    }

}
