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
    var header:String {get}
    var title:String {get}
    var acessibilityHints:String {get}
    var headerAcessibilityHint:String {get}
}
