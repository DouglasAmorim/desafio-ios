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
        
        return button
    }()
    
    // MARK: Public Attributes
    weak var delegate: CharacterFilterViewProtocol?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLayout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureLayout()
    }
    
    // MARK: Private Methods
    private func configureLayout() {
        self.backgroundColor = .white
        self.addSubviews()
        self.configureConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(nameTextField)
        self.addSubview(filterButton)
        
    }
    
    private func configureConstraints() {
        self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        self.nameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        self.nameTextField.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        self.nameTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
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
}
