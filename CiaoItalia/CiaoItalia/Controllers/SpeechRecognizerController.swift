//
//  SpeechRecognizerController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit


extension SpeechRecognizerController: SpeechRecognizerDelegate {
    func speechRecognizer(_ recognizer: SpeechRecognizer, didUpdateTranscript transcript: String) {
       
        self.transcript = transcript
    }
}

class SpeechRecognizerController: UIViewController {
    public var transcript:String = ""
    
    private var currentSourceLanguage = "pt-BR"
    private var currentTargetLanguage = "it"

   
    private let speechRecognizer = SpeechRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await speechRecognizer.setDelegate(self)
            await speechRecognizer.setLanguage(to: "pt-BR")
        }
    }
   
    @objc private func recordButtonTouchDown() {
        speechRecognizer.startTranscribing()
    }

    @objc private func recordButtonTouchUp() {
        speechRecognizer.stopTranscribing()
    }
}


