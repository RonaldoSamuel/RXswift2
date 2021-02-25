//
//  TelaCadastroView.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 25/02/21.
//

import UIKit
import MaterialComponents.MDCFilledTextField

class TelaCadastroView: UIView {
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.layer.shadowRadius = 10
        lbl.layer.shadowOffset = CGSize(width: 0, height: 5)
        lbl.layer.shadowOpacity = 0.5
        lbl.layer.shadowColor = UIColor.black.cgColor
        lbl.text = "Cadastro"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 35)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtNome: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowRadius = 10
        txt.layer.shadowOffset = CGSize(width: 5, height: 10)
        txt.layer.shadowOpacity = 10
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.label.text = "Nome"
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.setUnderlineColor(.gray, for: .editing)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setFilledBackgroundColor(.clear, for: .editing)
        txt.attributedPlaceholder = NSAttributedString(string: "Insira o seu Nome",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtEmail: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowRadius = 10
        txt.layer.shadowOffset = CGSize(width: 5, height: 10)
        txt.layer.shadowOpacity = 10
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.label.text = "E-Mail"
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.attributedPlaceholder = NSAttributedString(string: "Insira o seu E-Mail" , attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.setUnderlineColor(.gray, for: .editing)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setFilledBackgroundColor(.clear, for: .editing)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtSenha: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowRadius = 10
        txt.layer.shadowOffset = CGSize(width: 5, height: 10)
        txt.layer.shadowOpacity = 10
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.label.text = "Senha"
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.attributedPlaceholder = NSAttributedString(string: "Insira Sua Senha",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.setUnderlineColor(.gray, for: .editing)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setFilledBackgroundColor(.clear, for: .editing)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txtConfirmSenha: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowRadius = 10
        txt.layer.shadowOffset = CGSize(width: 5, height: 10)
        txt.layer.shadowOpacity = 10
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.label.text = "Confirmar Senha"
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.attributedPlaceholder = NSAttributedString(string: "Confirme Sua Senha",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.setUnderlineColor(.gray, for: .editing)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setFilledBackgroundColor(.clear, for: .editing)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var confirmBotao: MDCButton = {
        var btn = MDCButton()
        btn.layer.shadowRadius = 10
        btn.layer.shadowOffset = CGSize(width: 5, height: 10)
        btn.layer.shadowOpacity = 10
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.setTitle("Cadastrar-se", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews(){
        setupBackground()
        
        
        setupDescricaoLabel()
        setupCamposDeTexto()
        setupBotões()
    }
    
    
    func setupDescricaoLabel(){
        addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: topAnchor,constant: 50),
            descricaoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descricaoLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupCamposDeTexto(){
        addSubview(txtNome)
        NSLayoutConstraint.activate([
            txtNome.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: 50),
            txtNome.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            txtNome.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
        
        addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: txtNome.bottomAnchor,constant: 10),
            txtEmail.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            txtEmail.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
        
        addSubview(txtSenha)
        NSLayoutConstraint.activate([
            txtSenha.topAnchor.constraint(equalTo: txtEmail.bottomAnchor,constant: 10),
            txtSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            txtSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
        
        addSubview(txtConfirmSenha)
        NSLayoutConstraint.activate([
            txtConfirmSenha.topAnchor.constraint(equalTo: txtSenha.bottomAnchor,constant: 10),
            txtConfirmSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            txtConfirmSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
    }

    
    func setupBotões(){
        addSubview(confirmBotao)
        NSLayoutConstraint.activate([
            confirmBotao.topAnchor.constraint(equalTo: txtConfirmSenha.bottomAnchor, constant: 70),
            confirmBotao.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            confirmBotao.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            confirmBotao.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
