//
//  UIButtonExtension.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

extension UIButton {

    func round() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
