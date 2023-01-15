//
//  UITextFieldExtension.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

extension UITextField {

    func setUpTextField(title: String){
        text = title
        backgroundColor = UIColor(named: "BackgroundColor")
        textColor = UIColor(named: "White")
        layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
}
