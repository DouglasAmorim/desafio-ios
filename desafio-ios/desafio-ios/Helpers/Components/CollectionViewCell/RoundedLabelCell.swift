//
//  RoundedLabelCell.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 23/07/23.
//

import Foundation
import UIKit

class RoundedLabelCell: UICollectionViewCell {
    static let identifier = "RoundedLabelCell"
    
    // MARK: Private Attributes
    private let containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
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
        addSubview(self.containerView)
        containerView.addSubview(self.nameLabel)
    }
    
    private func configureConstraints() {
        self.containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.containerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.nameLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 4).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -4).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
    }
    
    // MARK: Public Func
    func setupCell(attributedText: NSAttributedString, isSelected: Bool) {
        self.nameLabel.attributedText = attributedText
        
        if isSelected {
            self.containerView.backgroundColor = .green
        } else {
            self.containerView.backgroundColor = .white
        }
    }
}
