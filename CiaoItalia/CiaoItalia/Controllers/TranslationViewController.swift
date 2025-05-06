//
//  TranslationMockViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslationViewController: UIViewController {
    private let speechRecognizer = SpeechRecognizer()
    private let translateManager = TranslateManager()
    private let translationView = TranslationView()
       
    public var transcript: String = ""
    
    override func loadView() {
       view = translationView
        
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(20, for: .default)
        let navWidth = navigationController?.navigationBar.bounds.width ?? view.bounds.width
         let container = UIView(frame: CGRect(x: 0, y: 0,
                                              width: navWidth,
                                              height: navigationController?.navigationBar.bounds.height ?? 100))
        container.backgroundColor = .clear
        let fuzzy = FuzzyFontLabel(text: "Tradutor",
                                       textStyle: .title1,
                                       textColor: .text)
        fuzzy.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(fuzzy)
        
        NSLayoutConstraint.activate([
          fuzzy.topAnchor.constraint(equalTo: container.topAnchor),
          fuzzy.leadingAnchor.constraint(equalTo: container.leadingAnchor)
        ])
        
        
        navigationItem.titleView = container
        
        translationView.textField.delegate = self
        Task {
           await speechRecognizer.setDelegate(self)
           await speechRecognizer.setLanguage(to: "pt-BR")
        }
      
        translationView.recordButton.addTarget(
           self,
           action: #selector(recordButtonTouchDown(_:)),
           for: .touchDown
        )
        translationView.recordButton.addTarget(
           self,
           action: #selector(recordButtonTouchUp(_:)),
           for: [.touchUpInside, .touchCancel]
        )

        translationView.swapLanguageButton.addTarget(
           self,
           action: #selector(didTapSwapLanguage(_:)),
           for: .touchUpInside
        )
        translationView.translateButton.addTarget(self,
            action: #selector(translate(_:)),
            for: .touchUpInside
        )
    }
       

    @objc private func recordButtonTouchDown(_ sender: UIButton) {
        Task {
            await speechRecognizer.setDelegate(self)
          
            speechRecognizer.startTranscribing()
        }
    }

    @objc private func recordButtonTouchUp(_ sender: UIButton) {
       speechRecognizer.stopTranscribing()
    }

    @objc private func didTapSwapLanguage(_ sender: UIButton) {
        Task { @MainActor in
            translateManager.swapButtonTapped()
            
            if translationView.translateLabel.text == "Italiano" {
                translationView.translateLabel.text = "Português"
                translationView.targetLabel.text = "Italiano"
                await speechRecognizer.setLanguage(to: "pt-BR")
            } else {
                translationView.translateLabel.text = "Italiano"
                translationView.targetLabel.text = "Português"
                // aqui provavelmente você quer "it-IT"
                await speechRecognizer.setLanguage(to: "it-IT")
            }
        }
    }
    @objc private func translate(_ sender:UIButton) {
        translateManager.input = translationView.textField.text
        translateManager.translateButtonTapped()
        translationView.translatedLabel.text = translateManager.result
    }
}

extension TranslationViewController: SpeechRecognizerDelegate {
    func speechRecognizer(_ recognizer: SpeechRecognizer, didUpdateTranscript transcript: String) {
        self.transcript = transcript
        translationView.textField.text = transcript
        print(transcript)
    }
}
extension TranslationViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let hasText = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        translationView.textField.setPlaceholder()
       
        translationView.translateButton.isEnabled = hasText
        translationView.translateButton.alpha = hasText ? 1.0 : 0.5
    }
    func textField(_ textField: UITextField,
                     shouldChangeCharactersIn range: NSRange,
                     replacementString string: String) -> Bool {
      
        let maxChars = 10
        let current = textField.text ?? ""
        print("entrou")
        guard let stringRange = Range(range, in: current) else {
            print("aqui")
            return false }
        let updated = current.replacingCharacters(in: stringRange, with: string)
        print(updated.count)
        return updated.count <= maxChars
      }
}
#Preview {
    TranslationView()
}
