//
//  TelaLoginViewModel.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import Foundation
import RxSwift
import RxCocoa

class TelaLoginViewModel {
    
    var disposable = DisposeBag()
    
    var model = TelaLoginModel()
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    func preencherValores(email: String,senha: String){
        self.email.accept("email \(email)")
        self.senha.accept("senha \(senha)")
    }
    
    var isEmailPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var isSenhaPreenchida: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var isBtnLoginPressed: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var isFormPreenchido: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    
    
    func viewDidLoad(){
        
       
        
        Observable.combineLatest(isEmailPreenchido, isSenhaPreenchida) { (email, senha) in
            return email == true && senha == true
        }
        .bind(to: isFormPreenchido)
        .disposed(by: disposable)
        
        email.asObservable().subscribe(onNext: { value in
            self.isEmailPreenchido.accept(value.count > 1)
            self.model.email = value
        }).disposed(by: disposable)
        
        senha.asObservable().subscribe(onNext: { value in
            self.isSenhaPreenchida.accept(value.count > 1)
            self.model.senha = value
        }).disposed(by: disposable)
    }
}
