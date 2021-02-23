//
//  TelaLoginModel.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 23/02/21.
//

import Foundation

struct TelaLoginModel {
    
    var email: String
    var senha: String
}

extension TelaLoginModel {
    
    init(){
        self.email = ""
        self.senha = ""
    }
}
