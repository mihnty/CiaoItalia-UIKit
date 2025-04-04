//
//  Hotel.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 04/04/25.
//


enum Hotel:CaseIterable {
    case reservation
    case key
    
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


