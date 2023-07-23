//
//  CharacterListViewController.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController {
    // MARK: Private Attributes
    private let characterListView = CharacterListView()
    private var characters: [CharacterInfoResponse] = []
    private var viewModel: CharacterListViewModelProtocol?
    
    // MARK: Initializers
    public init(viewModel: CharacterListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Lifecycle
    override func loadView() {
        self.view = self.characterListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.getCharacterList()
    }
    
    // MARK: Private Methods
    private func configureTableView() {
        self.characterListView.tableView.delegate = self
        self.characterListView.tableView.dataSource = self
        
        self.characterListView.tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
    }
    
    private func getCharacterList(page: Int = 1) {
        
        guard let viewModel = viewModel else { return }
        viewModel.getCharacterList(page: page, { result in
            var page: Int = page
            
            switch result {
            case .success(let characterResponse):
                
                if let characters = characterResponse.getCharacterList() {
                    self.characters.append(contentsOf: characters)
                }
                
                if let pageAmount = characterResponse.getInformationResponse()?.getPageAmount() {
                    if page < pageAmount {
                        page += 1
                        self.getCharacterList(page: page)
                    } else {
                        self.characterListView.tableView.reloadData()
                    }
                }
                
            case .failure(let erro):
                // TODO: Tratar cenario de erro
                break
            }
            
        })
    }
    
    private func openCharacterDetail(character: CharacterInfoResponse) {
        let characterDetailViewModel = CharacterDetailViewModel()
        let characterDetailViewController = CharacterDetailViewController(character: character, viewModel: characterDetailViewModel)
        characterDetailViewController.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterCell.HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell {
            
            // TODO: Use SAFE
            let character = characters[indexPath.row]
                  
            // TODO: Externalizar Strings
            let characterName = (character.getName() != "") ? character.getName() ?? NSLocalizedString("UNKNOWN", comment: "") : NSLocalizedString("UNKNOWN", comment: "")
            let attributedText = NSAttributedString(string: characterName, attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.black])
            
            if let imageLink = character.getImage() {
                DispatchQueue.global(qos: .background).async {
                   do {
                         let data = try Data.init(contentsOf: URL(string: imageLink)!)
                    
                          DispatchQueue.main.async {
                              let image: UIImage = UIImage(data: data) ?? UIImage()
                              
                              cell.setupCell(characterImage: image, characterAttributedText: attributedText)
                          }
                    }
                    catch {
                        // error
                    }
                }
            }

            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        self.openCharacterDetail(character: character)
    }
}
