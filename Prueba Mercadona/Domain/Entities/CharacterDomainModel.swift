//
//  CharactersDomainModel.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 15/1/23.
//

import UIKit

// MARK: - CharactersDomainModel

public struct CharacterDomainModel {

    // MARK: - Properties

    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let gender: String
    public let image: String

    // MARK: - Public function

    init(id: Int, name: String, status: StatusType, species: SpeciesType, gender: GendersType, image: String) {
        self.id = id
        self.name = name
        self.status = status.rawValue
        self.species = species.rawValue
        self.gender = gender.rawValue
        self.image = image
    }
}

// MARK: - StatusType

public enum StatusType: String {
    case Alive = "Vivo"
    case Dead = "Muerto"
    case unknown = "Desconocido"
}

// MARK: - SpeciesType

public enum SpeciesType: String {
    case Human = "Humano"
    case Alien = "Alien"
    case unknown = "Desconocido"
}

// MARK: - GendersType

public enum GendersType: String {
    case Female = "Femenino"
    case Male = "Masculino"
    case Genderless = "Sin género"
    case unknown = "Desconocido"
}
