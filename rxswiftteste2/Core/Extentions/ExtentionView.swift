//
//  ExtentionView.swift
//  rxswiftteste2
//
//  Created by Ronaldo Filho on 23/02/21.
//

import UIKit

extension UIView {
    
    func setupBackground(){
        let background = UIImageView(frame: .zero)
        background.image = UIImage(named: "background")
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
   
    
}
