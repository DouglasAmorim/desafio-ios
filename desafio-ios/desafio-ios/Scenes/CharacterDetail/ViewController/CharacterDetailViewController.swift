//
//  CharacterDetailViewController.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    // MARK: Private Attributes
    private var characterDetailView = CharacterDetailView()
    private var character: CharacterInfoResponse?
    private var viewModel: CharacterDetailViewModelProtocol?
    
    // MARK: Initializers
    public init(character: CharacterInfoResponse, viewModel: CharacterDetailViewModelProtocol) {
        self.character = character
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    // MARK: Lifecycle
    override func loadView() {
        self.view = self.characterDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavigationBar()
    }
    
    // MARK: Private Methods
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        self.title = NSLocalizedString("CHARACTER_DETAIL_TITLE", comment: "")
    }
    
    private func configureView() {
        guard let character = self.character else {
            navigationController?.popViewController(animated: false)
            return
        }
        
        let characterName = (character.getName() != "") ? character.getName() ?? NSLocalizedString("UNKNOWN", comment: "") : NSLocalizedString("UNKNOWN", comment: "")
        let nameAttributedText = NSAttributedString(string: characterName, attributes: [.font: UIFont.systemFont(ofSize: 36), .foregroundColor: UIColor.black])
        
        let characterStatus = (character.getStatus() != "") ? String(format: NSLocalizedString("DETAIL_STATUS", comment: ""), character.getStatus() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_STATUS", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let statusAttributedText = NSAttributedString(string: characterStatus, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        let characterSpecies = (character.getSpecies() != "") ? String(format: NSLocalizedString("DETAIL_SPECIES", comment: ""), character.getSpecies() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_SPECIES", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let speciesAttributedText = NSAttributedString(string: characterSpecies, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        let characterType = (character.getType() != "") ? String(format: NSLocalizedString("DETAIL_TYPE", comment: ""), character.getType() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_TYPE", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let typeAttributedText = NSAttributedString(string: characterType, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        let characterGender = (character.getGender() != "") ? String(format: NSLocalizedString("DETAIL_GENDER", comment: ""), character.getGender() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_GENDER", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let genderAttributedText = NSAttributedString(string: characterGender, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        let characterOrigin = (character.getOrigin()?.getName() != "") ? String(format: NSLocalizedString("DETAIL_ORIGIN", comment: ""), character.getOrigin()?.getName() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_ORIGIN", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let originAttributedText = NSAttributedString(string: characterOrigin, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        let characterLocation = (character.getLocation()?.getName() != "") ? String(format: NSLocalizedString("DETAIL_LOCATION", comment: ""), character.getLocation()?.getName() ?? NSLocalizedString("UNKNOWN", comment: "")) : String(format: NSLocalizedString("DETAIL_LOCATION", comment: ""), NSLocalizedString("UNKNOWN", comment: ""))
        let locationAttributedText = NSAttributedString(string: characterLocation, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
        
        if let imageLink = character.getImage() {
            DispatchQueue.global(qos: .background).async {
               do {
                     let data = try Data.init(contentsOf: URL(string: imageLink)!)
                
                      DispatchQueue.main.async {
                          let image: UIImage = UIImage(data: data) ?? UIImage()
                          
                          self.characterDetailView.setupView(characterImage: image,
                                                             nameAttributedText: nameAttributedText,
                                                             statusAttributedText: statusAttributedText,
                                                             speciesAttributedText: speciesAttributedText,
                                                             typeAttributedText: typeAttributedText,
                                                             genderAttributedText: genderAttributedText,
                                                             originAttributedText: originAttributedText,
                                                             locationAttributedText: locationAttributedText)
                      }
                } catch {
                    // TODO: HANDLE ERROR
                    self.navigationController?.popViewController(animated: false)
                }
            }
        }
    }
}
