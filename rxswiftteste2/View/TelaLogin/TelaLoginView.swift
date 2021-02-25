//
//  ViewFirstPage.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 19/02/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialButtons

class TelaLoginView: UIView {
    
    
    var isSenhaVisivel: Bool = true
    
    var scrlView: UIScrollView = {
        var scrl = UIScrollView()
        scrl.translatesAutoresizingMaskIntoConstraints = false
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
    
    var imageLogo: UIImageView = {
        var img = UIImageView(frame: UIScreen.main.bounds)
        img.image = UIImage(named: "Logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var emailLabel :UILabel = {
        var lbl = UILabel()
        lbl.text = "E-Mail"
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtEmail: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowOpacity = 0.2
        txt.layer.shadowColor = UIColor.white.cgColor
        txt.layer.shadowRadius = 10
        txt.setNormalLabelColor(.white, for: .normal)
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.trailingView = UIButton()
        txt.attributedPlaceholder = NSAttributedString(
            string: "Digite o Seu E-mail",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.setFilledBackgroundColor(.clear, for: .editing)
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
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var txtSenha: MDCFilledTextField = {
        var txt = MDCFilledTextField()
        txt.layer.shadowOpacity = 0.2
        txt.layer.shadowColor = UIColor.white.cgColor
        txt.layer.shadowRadius = 10
        txt.setFilledBackgroundColor(.clear, for: .editing)
        txt.setFilledBackgroundColor(.clear, for: .normal)
        txt.attributedPlaceholder = NSAttributedString(
            string: "Digite Sua Senha",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txt.setTextColor(.white, for: .editing)
        txt.setTextColor(.white, for: .normal)
        txt.isSecureTextEntry = true
        txt.textContentType = .password
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        txt.setTrailingAssistiveLabelColor(.red, for: .editing)
        txt.setTrailingAssistiveLabelColor(.red, for: .normal)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    
    
    var imagem = UIImage(named: "background")
    
    var btnToggleSenha: UIButton = {
        var btn = UIButton(type: .custom)
        var imagebtn = UIImage(named: "notVisible")
        btn.setImage(imagebtn, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnLogin: MDCButton = {
        var btn = MDCButton()
        btn.layer.cornerRadius = 15
        btn.setTitle("Logar", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnSingUp: MDCButton = {
        var btn = MDCButton()
        btn.layer.cornerRadius = 15
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
        backgroundColor = .black
        
        setupBackground()
        setupScrollView()
        setupLogo()
        setupCampoEmail()
        setupCampoSenha()
        setupBotaoLogar()
        setupBotaoSingUp()
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
    func setupLogo(){
        scrlView.addSubview(imageLogo)
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: topAnchor,constant: 40),
            imageLogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.4),
            imageLogo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: UIScreen.main.bounds.width*0.10),
            imageLogo.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -UIScreen.main.bounds.width*0.10)
        ])
    }
    
    func setupCampoEmail(){
        scrlView.addSubview(txtEmail)
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: imageLogo.bottomAnchor,constant: UIScreen.main.bounds.height*0.1),
            txtEmail.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            txtEmail.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40)
        ])
        scrlView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: txtEmail.topAnchor,constant: 8.5),
            emailLabel.leadingAnchor.constraint(equalTo: txtEmail.leadingAnchor,constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: txtEmail.trailingAnchor,constant: -25)
        ])
    }
    
    func setupCampoSenha(){
        scrlView.addSubview(txtSenha)
        NSLayoutConstraint.activate([
            txtSenha.topAnchor.constraint(equalTo: txtEmail.bottomAnchor,constant: 20),
            txtSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            txtSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40)
        ])
        scrlView.addSubview(senhaLabel)
        NSLayoutConstraint.activate([
            senhaLabel.bottomAnchor.constraint(equalTo: txtSenha.topAnchor,constant: 8.5),
            senhaLabel.leadingAnchor.constraint(equalTo: txtSenha.leadingAnchor,constant: 10),
            senhaLabel.trailingAnchor.constraint(equalTo: txtSenha.trailingAnchor,constant: -25)
        ])
        
        scrlView.addSubview(btnToggleSenha)
        NSLayoutConstraint.activate([
            btnToggleSenha.trailingAnchor.constraint(equalTo: txtSenha.trailingAnchor,constant: -5),
            btnToggleSenha.topAnchor.constraint(equalTo: txtSenha.topAnchor,constant: 8)
        ])
    }
    
    func setupBotaoLogar(){
        scrlView.addSubview(btnLogin)
        NSLayoutConstraint.activate([
            btnLogin.topAnchor.constraint(equalTo: txtSenha.bottomAnchor,constant: UIScreen.main.bounds.height*0.05),
            btnLogin.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            btnLogin.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            btnLogin.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupBotaoSingUp(){
        scrlView.addSubview(btnSingUp)
        NSLayoutConstraint.activate([
            btnSingUp.topAnchor.constraint(equalTo: btnLogin.bottomAnchor,constant: UIScreen.main.bounds.height*0.02),
            btnSingUp.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            btnSingUp.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            btnSingUp.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func toggleSenha(){
        isSenhaVisivel = !isSenhaVisivel
        txtSenha.isSecureTextEntry = isSenhaVisivel
        let imgVisible = UIImage(named: "visible")
        let imgNotVisible = UIImage(named: "notVisible")
        btnToggleSenha.setImage(isSenhaVisivel ? imgNotVisible : imgVisible, for: .normal)
    }
}
