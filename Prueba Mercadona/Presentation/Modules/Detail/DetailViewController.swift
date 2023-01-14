//
//  DetailViewController.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!

    // MARK: - Properties

    private let characterID: Int
    private let characterName: String

    // MARK: - Lifecycle

    init(characterID: Int, characterName: String) {
        self.characterID = characterID
        self.characterName = characterName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupUI()
    }

    // MARK: - Private functions

    @objc func enableButton() {
        saveButton.isEnabled = true
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor(named: "White");
        navigationItem.title = "Detalle del personaje nº \(characterID)"
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }

    private func setupUI() {
        saveButton.isEnabled = false
        saveButton.round()
        nameTextField.setUpTextField(title: characterName)
        nameTextField.addTarget(self, action: #selector(enableButton), for: .editingChanged)
    }

    // MARK: - IBActions

    @IBAction func saveChanges(_ sender: Any) {
        print("Button tapped")
    }

}
