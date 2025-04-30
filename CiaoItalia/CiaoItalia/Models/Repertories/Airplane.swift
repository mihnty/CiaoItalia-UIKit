//
//  Airplane.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 24/04/25.
//

enum Airplane:ContentType {
    case panino
    case biscotti
    case coperta
    case cuscino
    case cuffie
    case rivista
    case giornale
    
    var header:String {
        return "airplaneLand"
    }
    var title:String {
        return "serviço de bordo"
    }
    var imageName:String {
        switch self {
        case .panino:
            return "panino"
        case .biscotti:
            return "biscotti"
        case .coperta:
            return "coperta"
        case .cuscino:
            return "cuscino"
        case .cuffie:
            return "cuffie"
        case .rivista:
            return "rivista"
        case .giornale:
            return "giornale"
        }
    }
    var acessibilityHints:String {
        switch self {
        case .panino:
            return "Sanduíche"
        case .biscotti:
            return "Biscoitos"
        case .coperta:
            return "Cobertor"
        case .cuscino:
            return "Travesseiro"
        case .cuffie:
            return "Fones de ouvido"
        case .rivista:
            return "Revista"
        case .giornale:
            return "Jornal"
        }
    }
    var headerAcessibilityHint:String {
        return "avião"
    }
    var portuguese:String {
        switch self {
        case .panino:
            return "Sanduíche"
        case .biscotti:
            return "Biscoitos"
        case .coperta:
            return "Cobertor"
        case .cuscino:
            return "Travesseiro"
        case .cuffie:
            return "Fones de Ouvido"
        case .rivista:
            return "Revista"
        case .giornale:
            return "Jornal"
        }
    }
    var italian:String {
        switch self {
        case .panino:
            return "Panino"
        case .biscotti:
            return "Biscotti"
        case .coperta:
            return "Coperta"
        case .cuscino:
            return "Cuscino"
        case .cuffie:
            return "Cuffie"
        case .rivista:
            return "Rivista"
        case .giornale:
            return "Giornale"
        }
    }
    
    var dialogue: [DialogueItem] {
        return [
            .title("Serviço de bordo:"),
            .dialogue(DialogueLine(italian: "Buongiorno! Gradisce qualcosa da bere?", translation: "Bom dia! Deseja algo para beber?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, per favore. Un succo d’arancia.", translation: "Sim, por favor. Um suco de laranja.", type: .question)),
            .dialogue(DialogueLine(italian: "Certo. Vuole anche qualcosa da mangiare?", translation: "Claro. Deseja também algo para comer?", type: .answer)),
            .dialogue(DialogueLine(italian: "Cosa c’è disponibile?", translation: "O que tem disponível?", type: .question)),
            .dialogue(DialogueLine(italian: "Abbiamo panino, biscotti e frutta.", translation: "Temos sanduíche, biscoitos e frutas.", type: .answer)),
            .dialogue(DialogueLine(italian: "Allora prendo un panino, grazie.", translation: "Então vou querer um sanduíche, obrigado.", type: .question)),
            .dialogue(DialogueLine(italian: "Ha bisogno di qualcosa per stare più comodo? Un cuscino o una coperta?", translation: "Precisa de algo para ficar mais   confortável? Um travesseiro ou um cobertor?", type: .answer)),
            .dialogue(DialogueLine(italian: "Una coperta sarebbe perfetta.", translation: "Um cobertor seria perfeito.", type: .question)),
            .dialogue(DialogueLine(italian: "Certo. Vuole anche le cuffie per ascoltare musica o guardare un film?", translation: "Claro. Deseja também fones de ouvido para ouvir música ou ver um filme?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, grazie. Ha anche una rivista in italiano?", translation: "Sim, obrigado. Você tem também uma revista em italiano?", type: .question)),
            .dialogue(DialogueLine(italian: "Sì, abbiamo alcune riviste e giornali. Ecco a lei.", translation: "Sim, temos algumas revistas e jornais. Aqui está.", type: .answer)),
            .end("Fim de diálogo")
        ]
    }
}


