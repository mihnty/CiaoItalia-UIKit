//
//  HotelCheckin.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 16/04/25.
//

struct HotelCheckin: Dialogue {
    var dialogue: [DialogueItem] = [
        .title("Chegada ao Hotel:"),
        .dialogue(DialogueLine(italian: "Buongiorno! Benvenuto al nostro hotel.", translation: "Bom dia! Bem-vindo ao nosso hotel.", type: .answer)),
        .dialogue(DialogueLine(italian: "Buongiorno! Ho una prenotazione.", translation: "Bom dia! Eu tenho uma reserva", type: .question)),
        .dialogue(DialogueLine(italian: "A che nome?", translation: "Em nome de quem?", type: .answer)),
        .dialogue(DialogueLine(italian: "A nome di [S/N]", translation: "Em nome de [Seu Nome].", type: .question)),
        .dialogue(DialogueLine(italian: "Ecco la sua chiave. La sua stanza è al secondo piano.", translation: "Aqui está sua chave. Seu quarto é no segundo andar.", type: .answer)),
        .dialogue(DialogueLine(italian: "A che ora è la colazione?", translation: "A que horas é o café da manhã?", type: .question)),
        .dialogue(DialogueLine(italian: "Dalle sette alle dieci.", translation: "Das sete às dez.", type: .answer)),
        .dialogue(DialogueLine(italian: "Perfetto, grazie.", translation: "Perfeito, obrigado.", type: .question)),
        .dialogue(DialogueLine(italian: "Prego! Buon soggiorno!", translation: "De nada! Tenha uma boa estadia!", type: .answer)),
        .end("Fim de diálogo")
    ]
}
