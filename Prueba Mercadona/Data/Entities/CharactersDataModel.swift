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
    let results: [CharacterDataModel]
}

// MARK: - CharactersInfo

struct CharactersInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

// MARK: - CharacterDataModel

struct CharacterDataModel: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

// MARK: - Internal functions

extension CharacterDataModel {
    
    func parseToDomainModel() -> CharacterDomainModel {
        return CharacterDomainModel(id: self.id,
                                    name: self.name,
                                    status: getStatus(),
                                    species: getSpecies(),
                                    gender: getGender(),
                                    image: self.image)

    }

    func getStatus() -> StatusType {
        switch self.status {
        case "Alive": return .Alive
        case "Dead": return .Dead
        case "unknown": return .unknown
        default: return .unknown
        }
    }

    func getSpecies() -> SpeciesType {
        switch self.species {
        case "Human": return .Human
        case "Alien": return .Alien
        default: return .unknown
        }
    }

    func getGender() -> GendersType {
        switch self.gender {
        case "Female": return .Female
        case "Male": return .Male
        case "Genderless": return .Genderless
        case "unknown": return .unknown
        default: return .unknown
        }
    }
}
