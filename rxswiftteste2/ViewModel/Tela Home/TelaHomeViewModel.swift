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
    
    var dados2: BehaviorRelay<[TelaHomeModel]> = BehaviorRelay(value: [])
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var cep: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    func valoresPreenchidos(email: String, password: String){
        self.email.accept(email)
        self.senha.accept(password)
    }
    
    func loadCep(cep: BehaviorRelay<String>){
        APIClient.pedirCep (completion: { result in
            switch result {
            case .success(let ceps):
                print(ceps)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }, cep: self.cep.value)
    }
        
}
