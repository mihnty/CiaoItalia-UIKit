//
//  TranslateTextView.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 05/05/25.
//

import UIKit

class TranslateTextView: UITextView {
    private let placeholderLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = "Digitar texto"
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.textColor = .placeholderText
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    public let recordButton: UIButton = {
        let btn = UIButton(type: .system)
        let micImage = UIImage(systemName: "mic.fill")
        btn.setImage(micImage, for: .normal)
        btn.tintColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
        
        //self.text = ""
        self.font = .systemFont(ofSize: 16)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "text")?.cgColor
        self.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        self.textContainer.lineFragmentPadding = 0
        self.backgroundColor = UIColor(named: "cardColor")?.withAlphaComponent(0.6)
        
        addSubview(placeholderLabel)
        addSubview(recordButton)

    
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainerInset.left),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top),
            placeholderLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -textContainerInset.right),

            recordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            recordButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            recordButton.widthAnchor.constraint(equalToConstant: 28),
            recordButton.heightAnchor.constraint(equalToConstant: 28),
        ])

        placeholderLabel.isHidden = !text.isEmpty

        delegate = self
    }
}

extension TranslateTextView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
