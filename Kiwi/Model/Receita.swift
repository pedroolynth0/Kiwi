//
//  Receita.swift
//  Kiwi
//
//  Created by dti digital on 30/08/23.
//

import Foundation


struct Receita{

    var nome: String
    var categoria: String
    var imagem: String
    var etapas: [String]
    var ingredientes: [String]
    
    init(nome: String, categoria: String, imagem: String, etapas: [String], ingredientes: [String]) {
        self.nome = nome
        self.categoria = categoria
        self.imagem = imagem
        self.etapas = etapas
        self.ingredientes = ingredientes
    }
    var uniqueID: String {
        return UUID().uuidString
    }
}

