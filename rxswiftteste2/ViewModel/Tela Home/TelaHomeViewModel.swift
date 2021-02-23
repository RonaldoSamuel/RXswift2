//
//  TelaHomeViewModel.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import Foundation
import RxSwift
import RxCocoa

class TelaHomeViewModel {
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    func valoresPreenchidos(email: String, password: String){
        self.email.accept(email)
        self.senha.accept(password)
    }
    
}
