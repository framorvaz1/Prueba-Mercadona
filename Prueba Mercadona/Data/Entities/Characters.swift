//
//  Characters.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 15/1/23.
//

import UIKit

// MARK: - Characters

struct Characters: Codable {
    let info: CharactersInfo
    let results: [Character]
}

// MARK: - CharactersInfo

struct CharactersInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

// MARK: - Character

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
