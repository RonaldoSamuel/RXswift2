//
//  TelaHomeViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit
import RxSwift
import RxCocoa

class TelaHomeViewController: UIViewController {
    
    var presentationView = TelaHomeView()
    var viewModel = TelaHomeViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func bindView(){
        viewModel.email.bind { value in self.presentationView.labelEmail.text = "Ola \(value)" }.disposed(by: disposeBag)
        viewModel.email.bind { value in self.presentationView.labelSenha.text = "Ola \(value)" }.disposed(by: disposeBag)
        
    }
    
    
}
