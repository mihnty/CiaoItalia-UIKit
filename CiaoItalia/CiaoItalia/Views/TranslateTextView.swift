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
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "darkYellow")?.cgColor
        self.textContainerInset = UIEdgeInsets(top: 20, left: 8, bottom: 60, right: 8)
        self.textContainer.lineFragmentPadding = 0
        self.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 8, bottom: 60, right: 8)
        self.textContainer.lineFragmentPadding = 0
        self.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.2)
        self.textContainerInset = UIEdgeInsets(top: 8,
                                                   left: 8,
                                                   bottom: 60,
                                                   right: 8)
        self.textContainer.lineFragmentPadding = 0

       
        self.contentInset = UIEdgeInsets(top: 0,
                                         left: 0,
                                         bottom: 60,
                                         right: 0)
        self.scrollIndicatorInsets = self.contentInset

        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
        addSubview(placeholderLabel)

        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainerInset.left + 20),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top + 20),
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
    public func setPlaceholder() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}

extension TranslateTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
