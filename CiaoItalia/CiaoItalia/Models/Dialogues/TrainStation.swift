//
//  Train.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 16/04/25.
//

struct TrainStation: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Comprando a passagem:"),
        .dialogue(DialogueLine(italian: "Buona notte! Scusi, mi può dire a che ora parte il treno per Roma?", translation: "Boa noite! Licença, pode-me dizer de que horas parte o trem para Roma?", type: .question)),
        .dialogue(DialogueLine(italian: "Buona notte! Il treno per Roma arriva alle dieci e mezza e parte a mezzanotte.", translation: "Boa noite! O trem para Roma chega às dez e meia e parte à meia-noite.", type: .answer)),
        .dialogue(DialogueLine(italian: "Grazie! E quanto costa il biglietto?", translation: "Obrigado! E quanto custa o bilhete?", type: .question)),
        .dialogue(DialogueLine(italian: "Prima o seconda classe?", translation: "Primeira ou segunda classe?", type: .answer)),
        .dialogue(DialogueLine(italian: "Seconda, per favore.", translation: "Segunda, por favor.", type: .question)),
        .dialogue(DialogueLine(italian: "Andata e ritorno?", translation: "Ida e volta?", type: .answer)),
        .dialogue(DialogueLine(italian: "Solo andata, per favore.", translation: "Só ida, por favor.", type: .question)),
        .dialogue(DialogueLine(italian: "Costa 30 euro.", translation: "Custa 30 euros", type: .answer)),
        .dialogue(DialogueLine(italian: "Perfetto, vorrei prenderlo. Da quale binario parte il treno?", translation: "Perfeito, eu gostaria de comprá-lo. De qual plataforma parte o trem?", type: .question)),
        .dialogue(DialogueLine(italian: "Sul binario 4. Buon viaggio!", translation: "Da plataforma 3. Boa viagem!", type: .answer)),
        .end("Fim de diálogo")
    ]
}
