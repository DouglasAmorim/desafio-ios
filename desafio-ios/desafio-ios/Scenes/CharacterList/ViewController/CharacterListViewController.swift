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
    private var filteredCharacters: [CharacterInfoResponse] = []
    private var listIsFiltered: Bool = false
    private var viewModel: CharacterListViewModelProtocol?
    private let refreshControl = UIRefreshControl()
    
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
        self.configureNavigationBar()
        self.configureTableView()
        self.getCharacterList()
    }
    
    // MARK: Private Methods
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        self.title = NSLocalizedString("CHARACTER_TITLE", comment: "")
        
        let rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("FILTER", comment: ""), style: .plain, target: self, action: #selector(filterTapped))
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("CANCEL", comment: ""), style: .plain, target: self, action: #selector(cancelFilterTapped))
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    private func configureTableView() {
        self.characterListView.tableView.delegate = self
        self.characterListView.tableView.dataSource = self
       
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.characterListView.tableView.addSubview(refreshControl)
        
        self.characterListView.tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
    }
    
    private func getCharacterList(characterFilter: CharacterFilter = CharacterFilter()) {
        guard let viewModel = viewModel else { return }
        
        viewModel.getCharacterList(characterFilter: characterFilter, { result in
            var page: Int =  Int(characterFilter.getPage()) ?? 0
            
            switch result {
            case .success(let characterResponse):
                
                if let characters = characterResponse.getCharacterList() {
                    self.characters.append(contentsOf: characters)
                }
                
                if let pageAmount = characterResponse.getInformationResponse()?.getPageAmount() {
                    if page < pageAmount {
                        page += 1
                        characterFilter.setPage(page: String(page))
                        self.getCharacterList(characterFilter: characterFilter)
                        
                    } else {
                        self.refreshControl.endRefreshing()
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
    
    private func openCharacterFilter() {
        let characterFilterViewModel = CharacterFilterViewModel(characterService: CharacterService())
        let characterFilterViewController = CharacterFilterViewController(viewModel: characterFilterViewModel)
        
        characterFilterViewController.delegate = self
        characterFilterViewController.modalPresentationStyle = .overFullScreen
        
        navigationController?.pushViewController(characterFilterViewController, animated: true)
    }
    
    @objc private func filterTapped() {
        self.openCharacterFilter()
    }
    
    @objc private func cancelFilterTapped() {
        self.listIsFiltered = false
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.characterListView.tableView.reloadData()
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        self.getCharacterList()
    }
}

extension CharacterListViewController: CharacterFilterViewControllerProtocol {
    func finishedFilterCharacters(filteredList: [CharacterInfoResponse]) {
        self.filteredCharacters = filteredList
        self.listIsFiltered = true
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.navigationItem.leftBarButtonItem?.isEnabled = true
        self.characterListView.tableView.reloadData()
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listIsFiltered ? self.filteredCharacters.count : self.characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterCell.HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell {
            
            // TODO: Use SAFE
            let character = self.listIsFiltered ? self.filteredCharacters[indexPath.row] : characters[indexPath.row]
                  
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
                    } catch {
                        DispatchQueue.main.async {
                            cell.setupCell(characterAttributedText: attributedText)
                        }
                    }
                }
            }

            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.listIsFiltered ? self.filteredCharacters[indexPath.row] : self.characters[indexPath.row]
        self.openCharacterDetail(character: character)
    }
}
