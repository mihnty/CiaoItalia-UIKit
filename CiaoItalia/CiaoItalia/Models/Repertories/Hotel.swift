//
//  Hotel.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//


enum Hotel:ContentType {
    case reservation
    case key
    var dialogue:Dialogue {
        let option = HotelCheckin()
        return option as any Dialogue
    }
    var header:String {
        return "hotelLand"
    }
    var title:String {
        return "no hotel"
    }
    var acessibilityHints:String {
        switch self {
        case .reservation:
            return "bilhete comprovante de reserva"
        case .key:
            return "chaveiro com uma chave"
        }
    }
    var headerAcessibilityHint:String {
        return "fachada de hotel"
    }
    
    var imageName:String {
        switch self {
        case .reservation:
            return "reservation"
        case .key:
            return "key"
        }
    }
    
    var portuguese:String {
        switch self {
        case .reservation:
            return "Reserva"
        case .key:
            return "Chave"
        }
    }
    var italian:String {
        switch self {
        case .reservation:
            return "Prenotazione"
        case .key:
            return "Chiave"
    
        }
    }
}


