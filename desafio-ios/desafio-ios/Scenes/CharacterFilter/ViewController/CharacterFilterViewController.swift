//
//  CharacterFilterViewController.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation
import UIKit

class CharacterFilterViewController: UIViewController {
    // MARK: Private Attributes
    private var characterFilterView = CharacterFilterView()
    private var viewModel: CharacterFilterViewModelProtocol?
    private let characterStatus = [CharacterStatusEnum.ALIVE, CharacterStatusEnum.DEAD, CharacterStatusEnum.UNKNOWN]
    private var statusSelected: Int? = nil
    
    // MARK: Initializers
    public init(viewModel: CharacterFilterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    // MARK: Lifecycle
    override func loadView() {
        self.view = self.characterFilterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDelegate()
        self.setupView()
        self.configureNavigationBar()
    }
    
    // MARK: Private Methods
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        self.title = NSLocalizedString("CHARACTER_FILTER_TITLE", comment: "")
    }
    
    private func configureDelegate() {
        self.characterFilterView.delegate = self
        self.characterFilterView.collectionView.delegate = self
        self.characterFilterView.collectionView.dataSource = self
    }
    
    private func setupView() {
        let name = NSLocalizedString("TEXT_FIELD_FILTER_NAME", comment: "")
        let attributedText = NSAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black])
        
        self.characterFilterView.setupTitleTextField(attributedText)
    }
}

extension CharacterFilterViewController: CharacterFilterViewProtocol {
    func tapFilterButton() {
        // TODO: 
    }
}

extension CharacterFilterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 50)
    }
}

extension CharacterFilterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characterStatus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoundedLabelCell.identifier, for: indexPath) as? RoundedLabelCell {
            
            let attributedText = NSAttributedString(string: self.characterStatus[indexPath.row].rawValue, attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black])
            cell.setupCell(attributedText: attributedText, isSelected: self.statusSelected == indexPath.row)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.statusSelected == indexPath.row {
            self.statusSelected = nil
        } else {
            self.statusSelected = indexPath.row
        }
        
        self.characterFilterView.collectionView.reloadData()
    }
}
