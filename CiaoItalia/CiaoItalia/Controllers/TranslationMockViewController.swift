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
       navigationItem.title = "Tradutor"
       Task {
           await speechRecognizer.setDelegate(self)
           await speechRecognizer.setLanguage(to: "pt-BR")
       }
       /*
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
       */
       translationView.swapLanguageButton.addTarget(
           self,
           action: #selector(didTapSwapLanguage(_:)),
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
       translateManager.swapButtonTapped()
       
   }
}

extension TranslationViewController: SpeechRecognizerDelegate {
    func speechRecognizer(_ recognizer: SpeechRecognizer, didUpdateTranscript transcript: String) {
        self.transcript = transcript
        translationView.textField.text = transcript
        print(transcript)
    }
}

#Preview {
    TranslationView()
}
