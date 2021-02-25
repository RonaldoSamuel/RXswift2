//
//  TelaHomeViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialComponents.MaterialBottomAppBar

class TelaHomeViewController: UIViewController {
    
    var presentationView = TelaHomeView()
//    var helper = AlamofireHelper()
    var viewModel = TelaHomeViewModel()
    var loginScreen = TelaLoginViewController()
    let disposeBag = DisposeBag()
    
    var email: String = ""
    var senha: String = ""
        
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.14, green: 0.25, blue: 0.48, alpha: 1.00)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardTapped()
        viewModel.viewDidload()
        
        presentationView.bottomAppbar.trailingBarButtonItems?.first?.action = #selector(prints(_:))
        
        bindView()
    }
    
    func bindView(){
        presentationView.bottomAppbar.floatingButton.rx.tap.bind {
            self.viewModel.loadCep(cep: self.viewModel.cep)
            self.viewModel.isBotaoPressioned.accept(true) }.disposed(by: disposeBag)
        
        self.presentationView.txtCep.rx.text.orEmpty.bind(to: self.viewModel.cep).disposed(by: self.disposeBag)
        
        viewModel.email.bind { value in self.presentationView.labelEmail.text = "Ola \(value)"
            self.email = value
            
        }.disposed(by: disposeBag)
        viewModel.senha.bind { value in self.presentationView.labelSenha.text = "Sua Senha:\(value)"
            self.senha = value
            
        }.disposed(by: disposeBag)
        
        
        
        viewModel.isEmailPreenchido
            .bind {value in self.viewModel.isBotaoPressioned
                .bind {value2 in self.presentationView.txtCep.trailingAssistiveLabel.text = value2 ?
                    value ? "" : "E-mail Invalido" : ""}
                .disposed(by: self.disposeBag)
            }.disposed(by: disposeBag)
        
        
        
        
    }
    
    @objc func prints(_ sender: MDCBottomAppBarView){
        loginScreen.viewModel.preencherValores(email: email, senha: senha)
        navigationController?.pushViewController(loginScreen, animated: true)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
