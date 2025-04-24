//
//  Untitled.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 16/04/25.
//

struct Restaurant: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Almoço na rua:"),
        .dialogue(DialogueLine(italian: "Buongiorno! È la mia prima volta in Italia.", translation: "Bom dia! É minha primeira vez na Itália.", type: .question)),
        .dialogue(DialogueLine(italian: "Benvenuta! Hai già deciso cosa ordinare?", translation: "Bem-vinda! Já decidiu o que vai pedir?", type: .answer)),
        .dialogue(DialogueLine(italian: "Sì, vorrei una pizza margherita, per favore. Adoro il formaggio italiano!", translation: "Sim, gostaria de uma pizza margherita, por favor. Eu adoro o queijo italiano!", type: .question)),
        .dialogue(DialogueLine(italian: "Ottima scelta! Vuoi provare anche la nostra pasta alla carbonara?", translation: "Ótima escolha! Quer experimentar também nossa pasta alla carbonara?", type: .answer)),
        .dialogue(DialogueLine(italian: "Hmm, perché no? La prendo anche!", translation: "Hmm, por que não? Vou querer também!", type: .question)),
        .dialogue(DialogueLine(italian: "Perfetto, arrivo subito!", translation: "Perfeito, já volto.", type: .answer)),
        .dialogue(DialogueLine(italian: "Grazie.", translation: "Obrigada!", type: .question)),
        .end("Fim de diálogo")
    ]
}
