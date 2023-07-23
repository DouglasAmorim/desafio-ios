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
        self.characterFilterView.setupDelegate(self)
        self.characterFilterView.delegate = self
    }
    
    private func setupView() {
        let name = NSLocalizedString("TEXT_FIELD_FILTER_NAME", comment: "")
        let attributedText = NSAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.black])
        
        self.characterFilterView.setupTitleTextField(attributedText)
    }
}

extension CharacterFilterViewController: TextFieldComponentProtocol {
    func didEndEditing(text: String) {
        // TODO: Implement Did End Editing
    }
}

extension CharacterFilterViewController: CharacterFilterViewProtocol {
    func tapFilterButton() {
        // TODO: 
    }
}
