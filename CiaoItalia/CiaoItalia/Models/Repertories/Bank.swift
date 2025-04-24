//
//  Airplane.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 24/04/25.
//

enum Bank:ContentType {
    case cartaDiCredito
    case contoCorrente
    case contani
    case prelievo
    case estrattoConto
    case bancomat
    
    var header:String {
        return "bankLand"
    }
    var title:String {
        return "no banco"
    }
    var imageName:String {
        switch self {
        case .cartaDiCredito:
            return "cartaDiCredito"
        case .contoCorrente:
            return "contoCorrente"
        case .contani:
            return "contani"
        case .prelievo:
            return "prelievo"
        case .estrattoConto:
            return "estrattoConto"
        case .bancomat:
            return "bancomat"
        }
    }
    var acessibilityHints:String {
        switch self {
        case .cartaDiCredito:
            return "Cartão de crédito"
        case .contoCorrente:
            return "Conta corrente"
        case .contani:
            return "Dinheiro em espécie"
        case .prelievo:
            return "Saque"
        case .estrattoConto:
            return "Extrato bancário"
        case .bancomat:
            return "Caixa eletrônico"
        }
    }
    var headerAcessibilityHint:String {
        return "avião"
    }
    var portuguese:String {
        switch self {
        case .cartaDiCredito:
            return "Cartão de crédito"
        case .contoCorrente:
            return "Conta corrente"
        case .contani:
            return "Dinheiro em espécie"
        case .prelievo:
            return "Saque"
        case .estrattoConto:
            return "Extrato bancário"
        case .bancomat:
            return "Caixa eletrônico"
        }
    }
    var italian:String {
        switch self {
        case .cartaDiCredito:
            return "Cartão di Credito"
        case .contoCorrente:
            return "Conto Corrente"
        case .contani:
            return "Contani"
        case .prelievo:
            return "Previelo"
        case .estrattoConto:
            return "Estratto Conto"
        case .bancomat:
            return "Bancomat"
        }
    }
    
    var dialogue: [DialogueItem] {
        return [
            .title("No banco:"),
            .dialogue(DialogueLine(italian: "Buongiorno! In cosa posso aiutarla oggi?", translation: "Bom dia! Em que posso ajudá-la hoje?", type: .answer)),
            .dialogue(DialogueLine(italian: "Sì, per favore. Come posso prelevare dei contanti?", translation: "Sim, por favor. Como posso sacar dinheiro?", type: .question)),
            .dialogue(DialogueLine(italian: "Può usare il bancomat qui a sinistra. Serve il PIN.", translation: "Você pode usar o caixa eletrônico aqui à esquerda. Vai precisar da senha.", type: .answer)),
            .dialogue(DialogueLine(italian: "Perfetto. Posso anche cambiare dei soldi?", translation: "Perfeito. Eu também posso converter dinheiro?", type: .question)),
            .dialogue(DialogueLine(italian: "Certo. Di quale valuta ha bisogno?", translation: "Claro. De qual moeda você precisa?", type: .answer)),
            .dialogue(DialogueLine(italian: "Vorrei cambiare dei reais in euro, per favore", translation: "Gostaria de trocar reais por euros, por favor.", type: .question)),
            .dialogue(DialogueLine(italian: "Va bene. Il tasso di cambio di oggi è 1 euro = 5,30 reais.", translation: "Tudo bem. A cotação de hoje é 1 euro = 5,30 reais.", type: .answer)),
            .dialogue(DialogueLine(italian: "Bene. E posso pagare con la carta?", translation: "Ótimo. E posso pagar com o cartão?", type: .question)),
            .dialogue(DialogueLine(italian: "Sì, accettiamo carta e contanti.", translation: "Sim, aceitamos cartão e dinheiro.", type: .answer)),
            .end("Fim de diálogo")
        ]
    }
}


