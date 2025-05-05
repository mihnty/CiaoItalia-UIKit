//
//  SpeechRecognizerManager.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//
import Foundation
import AVFoundation
import Speech
import Observation


public actor SpeechRecognizer: Observable {
    @MainActor public var transcript: String = ""
    
    private var localeIdentifier: String
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private var recognizer: SFSpeechRecognizer?
    
    
    private weak var delegate: SpeechRecognizerDelegate?
    
    
    func setDelegate(_ delegate: SpeechRecognizerDelegate) {
        self.delegate = delegate
    }

    public init(localeIdentifier: String = "it-IT") {
        self.localeIdentifier = localeIdentifier
        self.recognizer = SFSpeechRecognizer(locale: Locale(identifier: localeIdentifier))
        guard recognizer != nil else {
            transcribe(RecognizerError.nilRecognizer)
            return
        }
        
        Task {
            do {
                guard await SFSpeechRecognizer.hasAuthorizationToRecognize() else {
                    throw RecognizerError.notAuthorizedToRecognize
                }
                guard await AVAudioSession.sharedInstance().hasPermissionToRecord() else {
                    throw RecognizerError.notPermittedToRecord
                }
            } catch {
                transcribe(error)
            }
        }
    }
    
    @MainActor public func startTranscribing() {
        Task {
            await transcribe()
        }
    }
    
    @MainActor public func resetTranscript() {
        Task {
            await reset()
        }
    }
    
    public func stopTranscribing() {
        request?.endAudio()
    }

    private func transcribe() {
        
        guard let recognizer, recognizer.isAvailable else {
            self.transcribe(RecognizerError.recognizerIsUnavailable)
            return
        }
        
        do {
            let (audioEngine, request) = try Self.prepareEngine()
            self.audioEngine = audioEngine
            self.request = request
            self.task = recognizer.recognitionTask(with: request, resultHandler: { [weak self] result, error in
                self?.recognitionHandler(audioEngine: audioEngine, result: result, error: error)
            })
        } catch {
            print("capturou erro")
            self.reset()
            self.transcribe(error)
        }
    }
    
    private func reset() {
        task?.cancel()
        audioEngine?.stop()
        audioEngine = nil
        request = nil
        task = nil
    }
    
    private static func prepareEngine() throws -> (AVAudioEngine, SFSpeechAudioBufferRecognitionRequest) {
        let audioEngine = AVAudioEngine()
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        let inputNode = audioEngine.inputNode
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            request.append(buffer)
        }
        audioEngine.prepare()
        try audioEngine.start()
        
        return (audioEngine, request)
    }
    
    nonisolated private func recognitionHandler(audioEngine: AVAudioEngine, result: SFSpeechRecognitionResult?, error: Error?) {
        let receivedFinalResult = result?.isFinal ?? false
        let receivedError = error != nil
        
        if receivedFinalResult || receivedError {
            print(error)
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            Task { @MainActor in
                await reset()
            }
        }
        
        if let result {
            print(result.bestTranscription.formattedString)
            transcribe(result.bestTranscription.formattedString)
        }
    }
    
    nonisolated private func transcribe(_ message: String) {
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            print(message)
            await self.delegate?.speechRecognizer(self, didUpdateTranscript: message)
            self.transcript = message
       
        }
    }

    nonisolated private func transcribe(_ error: Error) {
        let msg: String
        if let er = error as? RecognizerError {
            msg = "«\(er.message)»"
        } else {
            msg = "«\(error.localizedDescription)»"
        }
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            await self.delegate?.speechRecognizer(self, didUpdateTranscript: msg)
            self.transcript = msg
           
        }
    }
    public func setLanguage(to newLocale: String) async {
       reset()
       localeIdentifier = newLocale
       recognizer = SFSpeechRecognizer(locale: Locale(identifier: newLocale))
    }
}


extension SFSpeechRecognizer {
    static func hasAuthorizationToRecognize() async -> Bool {
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
    
}


extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            AVAudioApplication.requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}



