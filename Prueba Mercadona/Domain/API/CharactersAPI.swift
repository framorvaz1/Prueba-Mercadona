//
//  CharactersAPI.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 15/1/23.
//

import Foundation

final class CharactersAPI {

    // MARK: - Properties

    private let decoder = JSONDecoder()
    static let shared = CharactersAPI()

    // MARK: - Functions

    func fetchCharactersList(onCompletion: @escaping ([CharacterDomainModel]) -> ()) {
        let urlString = "https://rickandmortyapi.com/api/character"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let charactersList = try? self.decoder.decode(Characters.self, from: data) else {
                print("couldn't decode json")
                return
            }
            onCompletion(charactersList.results.map({ character in
                character.parseToDomainModel()
            }))
        }

        task.resume()
    }

}
