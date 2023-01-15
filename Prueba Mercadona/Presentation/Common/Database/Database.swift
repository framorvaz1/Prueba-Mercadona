//
//  Database.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 15/1/23.
//

import UIKit
import CoreData

protocol DatabaseProtocol {
    func save(character: CharacterDomainModel)
    func read() -> [CharacterDatabase]
    func delete(characterID: Int)
    func reload()
}

final class Database: DatabaseProtocol {

    // MARK: - Properties

    let contextoDatabase = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let shared = Database()
    var charactersListDatabase = [CharacterDatabase]()

    // MARK: - Functions

    internal func save(character: CharacterDomainModel) {
        let newCharacter = CharacterDatabase(context: self.contextoDatabase)
        newCharacter.id = Int16(character.id)
        newCharacter.name = character.name
        newCharacter.status = character.status
        newCharacter.species = character.species
        newCharacter.gender = character.gender
        newCharacter.image = character.image

        charactersListDatabase.append(newCharacter)

        reload()
    }

    func read() -> [CharacterDatabase] {
        let request: NSFetchRequest<CharacterDatabase> = CharacterDatabase.fetchRequest()

        do {
            charactersListDatabase = try contextoDatabase.fetch(request)
        } catch {
            print(error.localizedDescription)
        }

        return charactersListDatabase
    }

    func delete(characterID: Int) {
        contextoDatabase.delete(charactersListDatabase[characterID])
        reload()
    }

    func reload() {
        do {
            try contextoDatabase.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
