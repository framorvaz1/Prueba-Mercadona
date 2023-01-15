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

    private var charactersList: [Character] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        setupNavigationBar()
        requestCharactersList()
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
                self.charactersList = characters
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell {
            cell.bind(characterID: charactersList[indexPath.row].id, characterName: charactersList[indexPath.row].name)
            return cell
        }
            return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(characterID: charactersList[indexPath.row].id, characterName: charactersList[indexPath.row].name), animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           self.charactersList.remove(at: indexPath.row)
           self.tableView.beginUpdates()
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
           self.tableView.endUpdates()
        }
    }
}

