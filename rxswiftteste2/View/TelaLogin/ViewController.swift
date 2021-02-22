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

class ViewController: UIViewController{
    
    var telaHome = TelaHomeViewController()
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var presentationView = ViewFirstPage()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hideKeyboardTapped()
        
        presentationView.txtfield.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtfield.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        presentationView.txtfield.addTarget(self, action: #selector(done(_:)), for: .primaryActionTriggered)
        
        presentationView.campoSenha.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.campoSenha.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        presentationView.campoSenha.addTarget(self, action: #selector(done(_:)), for: .primaryActionTriggered)
        presentationView.btn.addTarget(self, action: #selector(ocultarSenha(_:)), for: .touchUpInside)
        
        presentationView.txtfield.addTarget(self, action: #selector(verificaNulo(_:)), for: .allEditingEvents)
        presentationView.campoSenha.addTarget(self, action: #selector(verificaNulo(_:)), for: .allEditingEvents)
        
        presentationView.outlined.addTarget(self, action: #selector(logar(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func verificaNulo(_ sender: MDCFilledTextField){
        if sender.text == "" {
            sender.trailingAssistiveLabel.text = "Campo Vazio"
        }else{
            sender.trailingAssistiveLabel.text = ""
        }
    }
    
    @objc func ocultarSenha(_ sender: UIButton){
        var oculto = presentationView.campoSenha.isSecureTextEntry
        print(oculto)
        if oculto == true {
            oculto = false
        }else {
            oculto = true
        }
        presentationView.campoSenha.isSecureTextEntry = oculto
    }
    
    @objc func logar(_ sender: UIButton){
        let email = presentationView.txtfield.text!
        let senha = presentationView.campoSenha.text!
        setName(email2: email, senha2: senha)
        
    }
    
    @objc func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @objc func callSnackBar(_ sender: UIButton){
        let message = MDCSnackbarMessage()
        message.text = "Campos Vazios"
        let action = MDCSnackbarMessageAction()
        message.action = action
        MDCSnackbarManager.default.show(message)
    }
    
    @objc func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.animateViewMoving(up: true, moveValue: 100)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.animateViewMoving(up: false, moveValue: 100)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    @IBAction func setName(email2: String, senha2: String){
        let vc = TelaHomeViewController()
        email.accept(email2)
        senha.accept(senha2)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
