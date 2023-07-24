//
//  CharacterListView.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import UIKit

class CharacterListView: UIView {
    // MARK: Private Attributes
    
    // MARK: Public Attributes
    lazy var loadingView = UIActivityIndicatorView.init(style: .medium)
    
    var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
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
        self.setupSubview()
        self.setupConstraints()
    }
    
    private func setupSubview() {
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.tableView)
        addSubview(self.loadingView)
    }
    
    private func setupConstraints() {
        self.loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
