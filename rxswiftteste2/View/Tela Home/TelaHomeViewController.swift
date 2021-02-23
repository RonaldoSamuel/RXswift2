//
//  TelaHomeViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialComponents.MDCAppBar

class TelaHomeViewController: UIViewController {
    
    var presentationView = TelaHomeView()
    var viewModel = TelaHomeViewModel()
    let disposeBag = DisposeBag()
    let appBar = MDCAppBar()
    
        
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
        self.addChild(appBar.headerViewController)
        viewModel.email.bind { value in print("Ola \(value)")}.disposed(by: disposeBag)
        bindView()
    }
    
    func bindView(){
        
        viewModel.email.bind { value in self.presentationView.labelEmail.text = "Ola \(value)" }.disposed(by: disposeBag)
        viewModel.senha.bind { value in self.presentationView.labelSenha.text = "Sua Senha:\(value)" }.disposed(by: disposeBag)
    }
}
