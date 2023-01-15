//
//  PersonageCell.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

class CharacterCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterID: UILabel!
    @IBOutlet weak var characterName: UILabel!

    // MARK: - Public functions

    func bind(characterImageURL: String, characterID: Int, characterName: String) {
        self.characterImage.downloaded(from: characterImageURL)
        self.characterImage.round()
        self.characterID.text = "Personaje nº \(characterID)"
        self.characterName.text = characterName
    }

}
