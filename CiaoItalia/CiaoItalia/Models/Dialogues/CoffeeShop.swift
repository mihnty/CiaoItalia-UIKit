//
//  Coffee.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 16/04/25.
//

//
//  Museum.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 08/04/25.
//

import Foundation

struct CoffeeShop: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Pedindo informação:"),
        .dialogue(DialogueLine(italian: "Buongiorno!", translation: "Bom dia!", type: .question)),
        .dialogue(DialogueLine(italian: "Buongiorno! Come posso aiutarla?", translation: "Bom dia! Como posso ajudá-lo?", type: .answer)),
        .dialogue(DialogueLine(italian: "Vorrei un caffè, per favore.", translation: "Eu gostaria de um café, por favor.", type: .answer)),
        .dialogue(DialogueLine(italian: "Certo, un caffè. Vuole qualcos'altro?", translation: "Certo, um café. Deseja mais alguma coisa?", type: .question)),
        .dialogue(DialogueLine(italian: "No grazie, il conto per favore", translation: "Não obrigado, a conta por favor.", type: .answer)),
        .dialogue(DialogueLine(italian: "Sono due euro e cinquanta.", translation: "São dois euros e cinquenta.", type: .question)),
        .dialogue(DialogueLine(italian: "Ecco a lei. Il caffè è delizioso, grazie!", translation: "Aqui está. O café está delicioso, obrigado!", type: .answer)),
        .end("Fim de diálogo")
    ]
}
