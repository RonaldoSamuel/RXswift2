//
//  ViewTelaHome.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit
import MaterialComponents.MaterialBottomAppBar
import MaterialComponents.MDCFilledTextField

class TelaHomeView: UIView{
    
    var labelEmail: UILabel = {
        var lbl = UILabel()
        lbl.text = "E-Mail"
        lbl.numberOfLines = 0
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var labelSenha: UILabel = {
        var lbl = UILabel()
        lbl.text = "Senha"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtCep: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var bottomAppbar: MDCBottomAppBarView = {
        var appbar = MDCBottomAppBarView()
        appbar.barTintColor = .orange
        appbar.floatingButton.accessibilityLabel = "Teste"
        appbar.floatingButton.setImage(UIImage(named: "notVisible"), for: .normal)
        let botao = UIBarButtonItem()
        botao.accessibilityLabel = "Comprar"
        botao.image = UIImage(named: "visible")
        appbar.trailingBarButtonItems = [ botao ]
        appbar.translatesAutoresizingMaskIntoConstraints = false
        return appbar
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        createSubviews()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        createSubviews()
    }
    
    func createSubviews(){
        backgroundColor = .white
        setupBackground()
        setupEmailLabel()
        setupSenhaLabel()
        setupTxtCep()
        setupBottomAppBar()
    }
    
    func setupEmailLabel(){
        addSubview(labelEmail)
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: topAnchor,constant: UIScreen.main.bounds.height*0.05),
            labelEmail.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            labelEmail.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            labelEmail.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSenhaLabel(){
        addSubview(labelSenha)
        NSLayoutConstraint.activate([
            labelSenha.topAnchor.constraint(equalTo: labelEmail.bottomAnchor,constant: 10),
            labelSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            labelSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            labelSenha.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTxtCep(){
        addSubview(txtCep)
        NSLayoutConstraint.activate([
            txtCep.topAnchor.constraint(equalTo: labelSenha.bottomAnchor,constant: 25),
            txtCep.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            txtCep.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
    }
    
    func setupBottomAppBar(){
        addSubview(bottomAppbar)
        NSLayoutConstraint.activate([
            bottomAppbar.leftAnchor.constraint(equalTo: leftAnchor),
            bottomAppbar.rightAnchor.constraint(equalTo: rightAnchor),
            bottomAppbar.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
}
