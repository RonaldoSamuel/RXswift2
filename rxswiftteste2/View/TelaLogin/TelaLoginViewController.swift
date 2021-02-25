//
//  ViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 19/02/21.
//

import UIKit
import MaterialComponents.MaterialSnackbar
import RxSwift
import RxCocoa

class TelaLoginViewController: UIViewController{
    
    var viewModel = TelaLoginViewModel()
    var presentationView = TelaLoginView()
    let disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindView()
        hideKeyboardTapped()
        viewModel.viewDidLoad()
        
        presentationView.txtEmail.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtEmail.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        presentationView.txtSenha.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtSenha.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
    }
    
    func bindView(){
        
        viewModel.email.bind {value in self.presentationView.txtEmail.text = value}.disposed(by: disposable)
        viewModel.senha.bind {value in self.presentationView.txtSenha.text = value}.disposed(by: disposable)
        
        presentationView.txtEmail.rx
            .text
            .orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposable)
        
        presentationView.txtSenha.rx
            .text
            .orEmpty
            .bind(to: viewModel.senha)
            .disposed(by: disposable)
        
        presentationView.txtSenha.rx
            .controlEvent(.primaryActionTriggered)
            .bind { self.hideKeyboard() }
            .disposed(by: disposable)
        
        presentationView.txtEmail.rx
            .controlEvent(.primaryActionTriggered)
            .bind { self.hideKeyboard() }
            .disposed(by: disposable)
        
        presentationView.btnToggleSenha.rx
            .tap
            .bind { self.presentationView.toggleSenha() }
            .disposed(by: disposable)
        
        presentationView.btnLogin.rx
            .tap
            .bind {
//                self.viewModel.loadCep(cep: self.viewModel.email)
                self.fazerLogin()
                self.viewModel.isBtnLoginPressed.accept(true)
            }.disposed(by: disposable)
        
        
        viewModel.isSenhaPreenchida.bind {value in self.viewModel.isBtnLoginPressed
            .bind {value2 in self.presentationView.txtSenha.trailingAssistiveLabel.text = value2 ?
                value ? "" : "Senha precisa ter 6 digitos" : ""}
            .disposed(by: self.disposable)
            
        }.disposed(by: disposable)
        
        viewModel.isEmailPreenchido
            .bind {value in self.viewModel.isBtnLoginPressed
                .bind {value2 in self.presentationView.txtEmail.trailingAssistiveLabel.text = value2 ?
                    value ? "" : "E-mail Invalido" : ""}
                .disposed(by: self.disposable)
            }.disposed(by: disposable)
        
        viewModel.isFormPreenchido
            .bind { value in
//                self.presentationView.btnLogin.isEnabled = value
                
            }
            .disposed(by: disposable)
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.animateViewMoving(up: true, moveValue: 100)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.animateViewMoving(up: false, moveValue: 100)
    }
    
    func fazerLogin(){
        var email: String = ""
        var senha: String = ""
        let vc = TelaHomeViewController()
        viewModel.email.bind {value in  email = value}.disposed(by: disposable)
        viewModel.senha.bind {value in senha = value}.disposed(by: disposable)
        vc.viewModel.valoresPreenchidos(email: viewModel.model.email, password: viewModel.model.senha)
        if email == "" || senha == "" {
            print("tentou logar")
        }else{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
