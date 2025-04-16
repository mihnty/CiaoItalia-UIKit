//
//  Museum.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 08/04/25.
//

import Foundation

struct Museum: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Pedindo informação:"),
        .dialogue(DialogueLine(italian: "Buon pomeriggio! Scusi, mi sa dire dove è il museo?", translation: "Boa tarde! Com licença, você poderia me dizer onde é museu?", type: .question)),
        .dialogue(DialogueLine(italian: "Buon pomeriggio! Il museo è a destra di quella piazza.", translation: "Boa tarde! O museu é a direita daquela praça.", type: .answer)),
        .dialogue(DialogueLine(italian: "Buon pomeriggio! Il museo è a destra di quella piazza.", translation: "Boa tarde! O museu é a direita daquela praça.", type: .answer)),
        .dialogue(DialogueLine(italian: "Grazie! Sa dove posso trovare un buon ristorante qui vicino?", translation: "Obrigado! Você sabe onde posso encontrar um bom restaurante por aqui?", type: .question)),
        .dialogue(DialogueLine(italian: "Certo! C'è un ottimo ristorante italiano proprio dietro l'angolo. Si chiama 'La Trattoria'.", translation: "Claro! Há um excelente restaurante italiano logo ali na esquina. Chama-se 'La Trattoria'.", type: .answer)),
        .dialogue(DialogueLine(italian: "Perfetto! E come faccio ad arrivare?", translation: "Perfeito! E como faço para chegar?", type: .question)),
        .dialogue(DialogueLine(italian: "È molto semplice. Va dritto per questa strada, poi gira a sinistra al semaforo. Dopo, prendere la prima a destra.", translation: "É muito simples. Você segue em frente nesta rua, depois vira à esquerda no semáforo. Depois, pegue a primeira a direita.", type: .answer)),
        .dialogue(DialogueLine(italian: "Grazie mille!", translation: "Muito obrigado!", type: .question)),
        .dialogue(DialogueLine(italian: "Prego!", translation: "De nada!", type: .answer)),
        .end("Fim de diálogo")
    ]
}
