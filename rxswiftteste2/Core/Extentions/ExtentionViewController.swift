//
//  ExtentionViewController.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 22/02/21.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}
