//
//  UIViewExtension.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

extension UIView {

    /// Get the file name of the View.
    public static var identifier: String {
        return String(describing: self)
    }

}
