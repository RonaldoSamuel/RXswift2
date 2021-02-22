//
//  ViewTelaHome.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit

class TelaHomeView: UIView{
    
    var labelEmail: UILabel = {
        var lbl = UILabel()
        lbl.text = "E-Mail"
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
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    func createSubviews(){
        backgroundColor = .white
        
        setupEmailLabel()
    }
    
    func setupEmailLabel(){
        addSubview(labelEmail)
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: topAnchor,constant: UIScreen.main.bounds.height*0.30),
            labelEmail.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            labelEmail.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            labelEmail.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSenhaLabel(){
        addSubview(labelSenha)
        NSLayoutConstraint.activate([
            labelSenha.topAnchor.constraint(equalTo: labelEmail.bottomAnchor,constant: 30),
            labelSenha.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            labelSenha.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            labelSenha.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
