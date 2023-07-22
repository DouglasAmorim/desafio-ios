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
        self.configureLayout()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureLayout()
    }
    
    // MARK: Private Methods
    private func configureLayout() {
        self.backgroundColor = UIColor(hex: "#D7F2BEFF")
        self.addSubviews()
        self.configureConstraints()
    }
    
    private func addSubviews() {
        addSubview(self.tableView)
    }
    
    private func configureConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
