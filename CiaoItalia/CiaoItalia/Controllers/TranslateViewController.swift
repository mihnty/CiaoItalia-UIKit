//
//  TranslateViewController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

import UIKit

class TranslateViewController:UIViewController {
    private let speechRecognizer:SpeechRecognizer = SpeechRecognizer()
    private let translateManager:TranslateManager = TranslateManager()
    
    private let translationView = TranslationView()
    
    public var transcript:String = ""
    
    override func loadView() {
        self.view = translationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        translationView.recordButton.addTarget(
            self,
            action: #selector(recordButtonTouchDown),
            for: .touchDown
        )
        translationView.recordButton.addTarget(
            self,
            action: #selector(recordButtonTouchUp),
            for: [.touchUpInside, .touchCancel]
        )
        translationView.swapLanguageButton.addTarget(
            self,
            action: #selector(translateManager.swapButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func recordButtonTouchDown() {
        speechRecognizer.startTranscribing()
    }

    @objc private func recordButtonTouchUp() {
        speechRecognizer.stopTranscribing()
    }
}

extension TranslateViewController: SpeechRecognizerDelegate {
    func speechRecognizer(_ recognizer: SpeechRecognizer, didUpdateTranscript transcript: String) {
        self.transcript = transcript
    }
}
