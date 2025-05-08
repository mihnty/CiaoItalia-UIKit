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
        
        navigationItem.backButtonTitle = "Tradução"
        view.backgroundColor = .background
        
        translationView.textField.delegate = self
        translateManager.textView = translationView.translatedLabel
        
        translateManager.onReadyChange = { [weak self] ready in
          guard let self = self, ready else { return }
          DispatchQueue.main.async {
            self.showAlert()
          }
        }
        
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
            
            let isCurrentlyItalian = translationView.translateLabel.text == "Italiano"
                let newSource =  isCurrentlyItalian ? "Português" : "Italiano"
                let newTarget =  isCurrentlyItalian ? "Italiano"  : "Português"
                let newLocale =   isCurrentlyItalian ? "pt-BR"      : "it-IT"
                
            UIView.transition(
              with: translationView.translateLabel,
              duration: 0.25,
              options: .transitionCrossDissolve,
              animations: { self.translationView.translateLabel.text = newSource },
              completion: nil
            )
            UIView.transition(
              with: translationView.targetLabel,
              duration: 0.25,
              options: .transitionCrossDissolve,
              animations: { self.translationView.targetLabel.text = newTarget },
              completion: nil
            )
            
            await speechRecognizer.setLanguage(to: newLocale)
        }
    }
    @objc private func translate(_ sender:UIButton) {
        translationView.textField.setIsWaiting() 
        translateManager.input = translationView.textField.text
        translateManager.translateButtonTapped()
        translationView.translatedLabel.setText()
    }
    func showAlert() {
      
        let alert = UIAlertController(
            title: "Erro na tradução",
        message: "Desculpe, algo deu errado durante a tradução",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.translateManager.isWrong = false
                print("Usuário tocou em OK")
            }
        ))
        
        present(alert, animated: true, completion: nil)
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
        translationView.translatedLabel.text = "" 
        translationView.translateButton.isEnabled = hasText
        UIView.animate(withDuration: 0.25) {
            self.translationView.translateButton.alpha = hasText ? 1.0 : 0.5
        }
    }
    func textView(_ textView: UITextView,
                    shouldChangeTextIn range: NSRange,
                    replacementText text: String) -> Bool {
        //fechar o teclado quando apertar em return
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
          
        //contar o máximo de caracteres
        let maxChars = 140
        let current = textView.text ?? ""
        guard let stringRange = Range(range, in: current) else { return false }
        let updated = current.replacingCharacters(in: stringRange, with: text)
        return updated.count <= maxChars
    }

    
   
    func textViewDidBeginEditing(_ textView: UITextView) {
        translationView.textField.setPlaceholder(isEditing: true)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        translationView.textField.setPlaceholder()
        
    }
    
}
#Preview {
    TranslationView()
}
