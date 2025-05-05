//
//  SpeechController.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 29/03/25.
//

import AVFoundation

class SpeechManager:NSObject, AVSpeechSynthesizerDelegate {
    static let shared = SpeechManager()
    private(set) var isPlaying = false
    let synthesizer = Synthesizer()
    var indexPath:IndexPath?
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

    func speak(_ text: String, indexPath: IndexPath) {
        guard !isPlaying else { return }
        isPlaying = true
        Task { @MainActor in
            await self.synthesizer.speak(text)
            self.indexPath = indexPath
        }
    }

    func speak(_ text: String) {
        guard !isPlaying else { return }
        isPlaying = true
        Task { @MainActor in
            await self.synthesizer.speak(text)
        }
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        guard let path = self.indexPath else {
            self.delegate?.changeWhoIsSpeaking(indexPath: nil)
            return
        }
        self.delegate?.changeWhoIsSpeaking(indexPath: path)
        self.delegate?.startSpeech()
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        indexPath = nil
        self.delegate?.finishSpeech()
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isPlaying = false
            self.delegate?.finishSpeech()
        }
    }
    
}
actor Synthesizer {
    private var synthesizer = AVSpeechSynthesizer()
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
        synthesizer.speak(utterance)
    }
}
protocol SpeechManagerDelegate: AnyObject {
    func startSpeech()
    func finishSpeech()
    func changeWhoIsSpeaking(indexPath:IndexPath?)
}
