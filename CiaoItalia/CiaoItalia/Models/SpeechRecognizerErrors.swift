//
//  SpeechRecognizerErros.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 30/04/25.
//

enum RecognizerError: Error {
    case nilRecognizer
    case notAuthorizedToRecognize
    case notPermittedToRecord
    case recognizerIsUnavailable
    
    public var message: String {
        switch self {
        case .nilRecognizer: return "Não foi possível iniciar o reconhecedor de voz"
        case .notAuthorizedToRecognize: return "O reconhecimento de voz não foi autorizado"
        case .notPermittedToRecord: return "A gravação de voz não foi autorizada"
        case .recognizerIsUnavailable: return "O reconhecedor de voz está indisponível"
        }
    }
}
