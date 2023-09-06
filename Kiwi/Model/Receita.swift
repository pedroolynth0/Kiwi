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
    var descricao: String
    var imagem: String
    var etapas: [String]
    var ingredientes: [String]
    var dificuldade: String
    var tempo: String
    
    init(nome: String, categoria: String,descricao: String, imagem: String, etapas: [String], ingredientes: [String], dificuldade: String, tempo: String) {
        self.nome = nome
        self.categoria = categoria
        self.descricao = descricao
        self.imagem = imagem
        self.etapas = etapas
        self.ingredientes = ingredientes
        self.dificuldade = dificuldade
        self.tempo = tempo
    }
    var uniqueID: String {
        return UUID().uuidString
    }
}

