//
//  Arrows.swift
//  CiaoItalia
//
//  Created by Pedro Fernandes Barreto Costa on 16/04/25.
//

import UIKit

enum ArrowDirection {
    case left, right
    
    var imageName: String {
        switch self {
        case .left:  return "MainScreenLeftArrow"
        case .right: return "MainScreenRightArrow"
        }
    }
    
    var action: Selector {
        switch self {
        case .left:  return #selector(CarouselViewController.didTapLeft)
        case .right: return #selector(CarouselViewController.didTapRight)
        }
    }
}
