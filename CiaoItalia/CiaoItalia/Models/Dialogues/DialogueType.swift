//
//  DialogueType.swift
//  CiaoItalia
//
//  Created by Alice Barbosa on 10/04/25.
//

import Foundation

enum DialogueType {
    case question
    case answer
}

enum DialogueItem {
    case title(String)
    case dialogue(DialogueLine)
    case end(String)
}
