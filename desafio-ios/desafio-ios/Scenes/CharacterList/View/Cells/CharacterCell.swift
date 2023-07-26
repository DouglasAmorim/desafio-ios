//
//  CharacterCell.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
    static let identifier = "CharacterCell"
    static let HEIGHT: CGFloat = 80
    
    override func prepareForReuse() {
        self.characterImageView.image = nil
        self.characterNameLabel.text = nil
    }
    
    // MARK: Private Attributes
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 24
        
        return imageView
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // MARK: Public Attributes
    
    // MARK: Initializers
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(self.characterImageView)
        addSubview(self.characterNameLabel)
    }
    
    private func configureConstraints() {
        self.characterImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        self.characterImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        self.characterImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        self.characterImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.characterNameLabel.leftAnchor.constraint(equalTo: self.characterImageView.rightAnchor, constant: 48).isActive = true
        self.characterNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        self.characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    // MARK: Public Methods
    func setupCell(characterImage: UIImage? = nil, characterAttributedText: NSAttributedString) {
        if let characterImage = characterImage {
            self.characterImageView.image = characterImage
        }
        
        self.characterNameLabel.attributedText = characterAttributedText
    }
}
