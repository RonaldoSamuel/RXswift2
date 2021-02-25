//
//  TelaHomeModel.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 24/02/21.
//

import Foundation

struct TelaHomeModel: Codable {
    var cep: String
    var logradouro: String
    var complemento: String
    var bairro: String
    var localidade: String
    var uf: String
    var ibge: String
    var gia: String
    var ddd: String
    var siafi: String
        
}

extension TelaHomeModel{
    
    init() {
        self.cep = ""
        self.logradouro = ""
        self.complemento = ""
        self.bairro = ""
        self.localidade = ""
        self.uf = ""
        self.ibge = ""
        self.gia = ""
        self.ddd = ""
        self.siafi = ""
    }
    
}
