//
//  DetailViewController.swift
//  Prueba Mercadona
//
//  Created by francisco.moreno.local on 14/1/23.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var specieTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!

    // MARK: - Properties

    private let characterImageURL: String
    private let characterID: Int
    private let characterName: String
    private let characterStatus: String
    private let characterSpecie: String
    private let characterGender: String

    // MARK: - Lifecycle

    init(characterImageURL: String,
         characterID: Int,
         characterName: String,
         characterStatus: String,
         characterSpecie: String,
         characterGender: String) {
        self.characterImageURL = characterImageURL
        self.characterID = characterID
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterSpecie = characterSpecie
        self.characterGender = characterGender
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

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor(named: "White");
        navigationItem.title = "Detalle del personaje nº \(characterID)"
        navigationController?.navigationBar.topItem?.backButtonTitle = " "
    }

    private func setupUI() {
        saveButton.isEnabled = false
        saveButton.round()
        characterImage.downloaded(from: characterImageURL)
        characterImage.round()
        nameTextField.setUpTextField(title: characterName)
        statusTextField.setUpTextField(title: characterStatus)
        specieTextField.setUpTextField(title: characterSpecie)
        genderTextField.setUpTextField(title: characterGender)
        nameTextField.addTarget(self, action: #selector(enableButton), for: .editingChanged)
        statusTextField.addTarget(self, action: #selector(enableButton), for: .editingChanged)
        specieTextField.addTarget(self, action: #selector(enableButton), for: .editingChanged)
        genderTextField.addTarget(self, action: #selector(enableButton), for: .editingChanged)

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - IBActions

    @IBAction func saveChanges(_ sender: Any) {
        let alertController = UIAlertController(title: "Algo ha fallado", message: "Este botón no hace nada. Función no implementada aún.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

}
