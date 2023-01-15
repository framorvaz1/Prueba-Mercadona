//
//  UIImageExtension.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 15/1/23.
//

import UIKit

extension UIImageView {

    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }

    func downloaded(from urlString: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: urlString) else { return }
        downloaded(from: url, contentMode: mode)
    }

    func round() {
        layer.cornerRadius = bounds.height / 2
    }
}
