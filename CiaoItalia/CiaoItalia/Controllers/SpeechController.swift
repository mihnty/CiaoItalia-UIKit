//
//  SpeechController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 29/03/25.
//

import AVFoundation

class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()
    static let shared = SpeechManager()
    private init() {
        setAudioSession()
    }
    private func setAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("audio session config error: " + error.localizedDescription)
        }
    }
    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT") // Italiano
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
}
