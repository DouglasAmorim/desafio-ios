//
//  CharacterFilterView.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation
import UIKit

protocol CharacterFilterViewProtocol: AnyObject {
    func tapFilterButton()
}

class CharacterFilterView: UIView {
    // MARK: Private Attributes
    lazy var loadingView = UIActivityIndicatorView.init(style: .medium)
    
    private let nameTextField: TextFieldComponent = {
        let textField = TextFieldComponent()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("FILTER_BUTTON", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(tapFilterButton), for: .touchUpInside)
        button.accessibilityIdentifier = "FILTER_BUTTON"
        return button
    }()
    
    // MARK: Public Attributes
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(RoundedLabelCell.self, forCellWithReuseIdentifier: RoundedLabelCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    weak var delegate: CharacterFilterViewProtocol?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupLayout()
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        self.backgroundColor = .white
        self.setupSubviews()
        self.setupConstraints()
    }
    
    private func setupSubviews() {
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.nameTextField)
        self.addSubview(self.collectionView)
        self.addSubview(self.filterButton)
        self.addSubview(self.loadingView)
    }
    
    private func setupConstraints() {
        self.loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        self.nameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        self.nameTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        self.nameTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        self.collectionView.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 24).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 24).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.filterButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        self.filterButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        self.filterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        self.filterButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    @objc private func tapFilterButton() {
        self.delegate?.tapFilterButton()
    }
    
    // MARK: Public Methods
    func setupDelegate(_ delegate: TextFieldComponentProtocol) {
        self.nameTextField.delegate = delegate
    }

    func setupTitleTextField(_ attributedText: NSAttributedString) {
        self.nameTextField.setupTitle(attributedText)
    }
    
    func getTextFieldText() -> String? {
        return self.nameTextField.getTextFieldText()
    }
}
