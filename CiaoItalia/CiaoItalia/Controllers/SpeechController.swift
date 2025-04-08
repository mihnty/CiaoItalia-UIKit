//
//  SpeechController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 29/03/25.
//

import AVFoundation

class SpeechManager:NSObject, AVSpeechSynthesizerDelegate {
    static let shared = SpeechManager()
    let synthesizer = Synthesizer()
    weak var delegate:SpeechManagerDelegate?
    override private init() {
        super.init()
        setAudioSession()
        Task {
            await synthesizer.setDelegate(delegate: self)
        }
    }
    private func setAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("audio session config error: " + error.localizedDescription)
        }
    }
    func speak(_ text:String){
        Task {
            await self.synthesizer.speak(text)
        }
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.delegate?.startSpeech()
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.delegate?.finishSpeech()
    }
    
}
actor Synthesizer {
    private let synthesizer = AVSpeechSynthesizer()
    func setDelegate(delegate:AVSpeechSynthesizerDelegate) {
        synthesizer.delegate = delegate
    }
    func speak(_ text: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT") // Italiano
        utterance.rate = 0.5
        utterance.postUtteranceDelay = 0.5
        synthesizer.speak(utterance)
    }
}
protocol SpeechManagerDelegate: AnyObject {
    func startSpeech()
    func finishSpeech()
}
