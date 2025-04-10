//
//  Repertory.swift
//  CiaoItalia
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 10/04/25.
//

protocol ContentType:CaseIterable {
    var italian:String {get}
    var portuguese:String {get}
    var imageName:String {get}
    
}
struct Repertory<T:ContentType> {
    let value:T
    
    func getImageName() -> String {
        return value.imageName
    }
    func getPortuguese() -> String {
        return value.portuguese
    }
    func getItalian() -> String {
        return value.italian
    }
}
