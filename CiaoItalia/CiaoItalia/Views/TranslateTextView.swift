//
//  TranslateTextView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 05/05/25.
//

import UIKit

class TranslateTextView: UITextView {
    private let placeholderLabel: UILabel = {
        let lb = FuzzyFontLabel(text: "Digitar texto", textStyle: .body, textColor: .text.withAlphaComponent(0.6))
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = "Digitar texto"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    

    var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    override var text: String! {
        didSet {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        self.font = .systemFont(ofSize: 16)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "mediumGrey")?.cgColor
        self.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        self.textContainer.lineFragmentPadding = 0
        self.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.6)
        
        addSubview(placeholderLabel)

        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainerInset.left),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top),
            placeholderLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -textContainerInset.right)
        ])

        placeholderLabel.isHidden = !text.isEmpty

        delegate = self
    }
    
    public func setPlaceholder(placeholder:String) {
        self.placeholderLabel.text = placeholder
    }
    public func disableWrite() {
        self.isEditable = false
    }
}

extension TranslateTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
