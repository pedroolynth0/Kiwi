//
//  Strings.swift
//  Kiwi
//
//  Created by dti digital on 17/02/24.
//

import Foundation



enum Strings: Error {
    case addRecipe
    case editRecipe
    
    var title: String {
        switch self {
        case .addRecipe:
            return "Adicionar Receita"
        case .editRecipe:
            return "Editar Receita"
        }
    }
}
