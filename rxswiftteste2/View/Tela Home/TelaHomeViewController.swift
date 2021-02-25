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
        
        
        presentationView.bottomAppbar.floatingButton.addTarget(self, action: #selector(prints(_:)), for: .touchUpInside)
        
//        viewModel.email.bind { value in print("Ola \(value)")}.disposed(by: disposeBag)
        bindView()
    }
    
    func bindView(){
        
        self.presentationView.txtCep.rx.text.orEmpty.bind(to: self.viewModel.cep).disposed(by: self.disposeBag)
        
        viewModel.email.bind { value in self.presentationView.labelEmail.text = "Ola \(value)"
            self.email = value
            
        }.disposed(by: disposeBag)
        viewModel.senha.bind { value in self.presentationView.labelSenha.text = "Sua Senha:\(value)"
            self.senha = value
            
        }.disposed(by: disposeBag)
        
        presentationView.bottomAppbar.floatingButton.rx.tap.bind { self.viewModel.loadCep(cep: self.viewModel.cep) }.disposed(by: disposeBag)
        
    }
    
    @objc func prints(_ sender: MDCBottomAppBarView){
        
//        loginScreen.viewModel.preencherValores(email: email, senha: senha)
//        navigationController?.pushViewController(loginScreen, animated: true)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
