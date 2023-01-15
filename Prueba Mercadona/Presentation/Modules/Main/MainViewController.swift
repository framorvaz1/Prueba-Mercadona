//
//  ViewController.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    private var charactersList: [CharacterDomainModel] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setupNavigationBar()
        requestCharactersList()
        loadTable()
    }

    // MARK: - Private functions

    private func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupNavigationBar() {
        navigationItem.title = "Listado de personajes"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    private func requestCharactersList() {
        CharactersAPI.shared.fetchCharactersList(onCompletion: { characters in
            DispatchQueue.main.async {
                _ = characters.map { character in
                    Database.shared.save(character: character)
                }
            }
        })
    }

    private func loadTable() {
        _ = Database.shared.read().map { characterDataBase in
            charactersList.append(CharacterDomainModel(id: Int(characterDataBase.id),
                                                       name: characterDataBase.name ?? "",
                                                       status: StatusType(rawValue: characterDataBase.status ?? "") ?? .unknown,
                                                       species: SpeciesType(rawValue: characterDataBase.species ?? "") ?? .unknown,
                                                       gender: GendersType(rawValue: characterDataBase.gender ?? "") ?? .unknown,
                                                       image: characterDataBase.image ?? ""))
        }
        self.tableView.reloadData()
    }
}

// MARK: - UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell {
            cell.bind(characterImageURL: charactersList[indexPath.row].image,
                      characterID: charactersList[indexPath.row].id,
                      characterName: charactersList[indexPath.row].name)
            return cell
        }
            return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(characterImageURL: charactersList[indexPath.row].image,
                                                                           characterID: charactersList[indexPath.row].id,
                                                                           characterName: charactersList[indexPath.row].name,
                                                                           characterStatus: charactersList[indexPath.row].status,
                                                                           characterSpecie: charactersList[indexPath.row].species,
                                                                           characterGender: charactersList[indexPath.row].gender),
                                                      animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Eliminar") { _, _, _ in
            Database.shared.delete(characterID: indexPath.row)
            self.charactersList.remove(at: indexPath.row)
        }
        deleteAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

