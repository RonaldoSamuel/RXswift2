//
//  ViewFirstPage.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 19/02/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons

class ViewFirstPage: UIView {
    
    var scrlView: UIScrollView = {
        var scrl = UIScrollView()
        scrl.translatesAutoresizingMaskIntoConstraints = false
        scrl.showsHorizontalScrollIndicator = false
        return scrl
    }()
    
    var descricaoLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Testando RXSwift Com Material io"
        lbl.backgroundColor = .black
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var emailLabel :UILabel = {
        var lbl = UILabel()
        lbl.text = "E-Mail"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtfield: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowOpacity = 0.2
        txt.layer.shadowColor = UIColor.white.cgColor
        txt.layer.shadowRadius = 10
        txt.setNormalLabelColor(.white, for: .normal)
        txt.placeholder = "Digite O Seu Email"
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setTrailingAssistiveLabelColor(.red, for: .editing)
        txt.setTrailingAssistiveLabelColor(.red, for: .normal)
        txt.sizeToFit()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var senhaLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Senha"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    var campoSenha: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowOpacity = 0.2
        txt.layer.shadowColor = UIColor.white.cgColor
        txt.layer.shadowRadius = 10
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.placeholder = "Digite Sua Senha"
        txt.isSecureTextEntry = true
        txt.textContentType = .password
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        txt.setTrailingAssistiveLabelColor(.red, for: .editing)
        txt.setTrailingAssistiveLabelColor(.red, for: .normal)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imagem = UIImage(named: "background")
    
    var btn: UIButton = {
        var btn = UIButton(type: .custom)
        let image = UIImage(named: "visible")
        btn.setImage(image, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var outlined: MDCButton = {
        var btn = MDCButton()
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowColor = UIColor.white.cgColor
        btn.layer.shadowRadius = 10
        btn.layer.cornerRadius = 7
        btn.setTitle("Logar", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var botaoLogin: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Entrar",for: .normal)
        btn.setTitleColor(.white, for: .normal)
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
        backgroundColor = .black
        
        setupBackground()
        setupScrollView()
        setupLabel()
        setupCampoEmail()
        setupCampoSenha()
        setupBotaoLogar()
    }
    
    func setupBackground(){
        addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupScrollView(){
        addSubview(scrlView)
        NSLayoutConstraint.activate([
            scrlView.topAnchor.constraint(equalTo: topAnchor),
            scrlView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrlView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrlView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupLabel(){
        scrlView.addSubview(descricaoLabel)
        NSLayoutConstraint.activate([
            descricaoLabel.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            descricaoLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            descricaoLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25)
        ])
    }
    
    func setupCampoEmail(){
        scrlView.addSubview(txtfield)
        NSLayoutConstraint.activate([
            txtfield.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor,constant: UIScreen.main.bounds.height*0.30),
            txtfield.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            txtfield.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40)
        ])
        scrlView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: txtfield.topAnchor,constant: 8.5),
            emailLabel.leadingAnchor.constraint(equalTo: txtfield.leadingAnchor,constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: txtfield.trailingAnchor,constant: -25)
        ])
    }
    func setupCampoSenha(){
        scrlView.addSubview(campoSenha)
        NSLayoutConstraint.activate([
            campoSenha.topAnchor.constraint(equalTo: txtfield.bottomAnchor,constant: 20),
            campoSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            campoSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40)
        ])
        scrlView.addSubview(senhaLabel)
        NSLayoutConstraint.activate([
            senhaLabel.bottomAnchor.constraint(equalTo: campoSenha.topAnchor,constant: 8.5),
            senhaLabel.leadingAnchor.constraint(equalTo: campoSenha.leadingAnchor,constant: 10),
            senhaLabel.trailingAnchor.constraint(equalTo: campoSenha.trailingAnchor,constant: -25)
        ])
        
        scrlView.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.trailingAnchor.constraint(equalTo: campoSenha.trailingAnchor,constant: -5),
            btn.topAnchor.constraint(equalTo: campoSenha.topAnchor,constant: 8)
        ])
    }
    
    func setupBotaoLogar(){
        scrlView.addSubview(outlined)
        NSLayoutConstraint.activate([
            outlined.topAnchor.constraint(equalTo: campoSenha.bottomAnchor,constant: 50),
            outlined.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            outlined.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            outlined.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
}
