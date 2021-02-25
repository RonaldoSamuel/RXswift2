//
//  TelaCadastroViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit

class TelaCadastroViewController: UIViewController {
    
    var presentationView = TelaCadastroView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardTapped()
        presentationView.txtNome.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtNome.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        presentationView.txtEmail.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtEmail.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        presentationView.txtSenha.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtSenha.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        
        presentationView.txtConfirmSenha.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        presentationView.txtConfirmSenha.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.setGradientBackground(colors: [UIColor(red: 0.03, green: 0.09, blue: 0.22, alpha: 0.10),UIColor(red: 0.03, green: 0.09, blue: 0.22, alpha: 0.30)], startPoint: .topRight, endPoint: .bottomRight)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.14, green: 0.25, blue: 0.48, alpha: 1.00)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.animateViewMoving(up: true, moveValue: 100)
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.animateViewMoving(up: false, moveValue: 100)
    }
    
}
