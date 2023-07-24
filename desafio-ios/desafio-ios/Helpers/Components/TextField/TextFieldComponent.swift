//
//  TextFieldComponent.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation
import UIKit

protocol TextFieldComponentProtocol: AnyObject {
    func didEndEditing(text: String)
}

class TextFieldComponent: UIView {
    // MARK: Private Attributes
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.addDoneButtonOnKeyboard()
        textField.delegate = self
        
        textField.accessibilityIdentifier = "NAME_TEXT_FIELD"
        
        return textField
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    // MARK: Public Attributes
    weak var delegate: TextFieldComponentProtocol?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureLayout()
    }
    
    // MARK: Private Methods
    private func configureLayout() {
        self.addSubviews()
        self.configureConstraints()
    }

    private func addSubviews() {
        addSubview(self.titleLabel)
        addSubview(self.textField)
        addSubview(self.underlineView)
    }
    
    private func configureConstraints() {
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        self.textField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4).isActive = true
        self.textField.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.textField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.underlineView.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 2).isActive = true
        self.underlineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.underlineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.underlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    // MARK: Public Methods
    func setupTitle(_ attributedText: NSAttributedString) {
        self.titleLabel.attributedText = attributedText
    }
    
    func getTextFieldText() -> String? {
        return self.textField.text
    }
}

extension TextFieldComponent: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        if let text = textField.text {
            self.delegate?.didEndEditing(text: text)
        }
    }
}
