//
//  Museum.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 08/04/25.
//

import Foundation

struct Travel: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Pedindo informação:"),
        .dialogue(DialogueLine(italian: "Ciao! Sei pronto per il viaggio?", translation: "Olá! Você está pronto para a viagem?", type: .answer)),
        .dialogue(DialogueLine(italian: "Quasi pronto. Puoi aiutarmi a fare un checklist?", translation: "Quase pronto. Você pode me ajudar a fazer um checklist?", type: .answer)),
        .dialogue(DialogueLine(italian: "Certo! Prima di tutto, hai il passaporto?", translation: "Claro! Primeiro de tudo, você tem o passaporte?", type: .question)),
        .dialogue(DialogueLine(italian: "Sì, ce l'ho qui.", translation: "Sim, eu tenho aqui.", type: .answer)),
        .dialogue(DialogueLine(italian: "Perfetto! E il biglietto di viaggio?", translation: "Perfeito! E o bilhete de viagem?", type: .question)),
        .dialogue(DialogueLine(italian: "Sì, eccolo.", translation: "Sim, aqui está.", type: .answer)),
        .dialogue(DialogueLine(italian: "Ottimo! Hai una carta?", translation: "Ótimo! Você tem um mapa?", type: .question)),
        .dialogue(DialogueLine(italian: "Sì, ho una carta.", translation: "Sim, eu tenho um mapa.", type: .answer)),
        .dialogue(DialogueLine(italian: "Benissimo! Sei pronto per partire. Buon viaggio!", translation: "Perfeito! Você está pronto para partir. Boa viagem!", type: .question)),
        .dialogue(DialogueLine(italian: "Grazie! Buon viaggio!", translation: "Obrigado! Boa viagem!", type: .answer)),

        .end("Fim de diálogo")
    ]
}
