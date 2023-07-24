//
//  CharacterDetailView.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation
import UIKit

class CharacterDetailView: UIView {
    // MARK: Private Attributes
    private let containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 48
        
        return imageView
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()

    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let characterSpeciesLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()

    private let characterTypeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let characterOriginLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let characterLocationLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        
        return label
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
        self.backgroundColor = .white
        self.addSubviews()
        self.configureConstraints()
    }
    
    private func addSubviews() {
        containerView.addSubview(self.characterImageView)
        containerView.addSubview(self.characterNameLabel)
        containerView.addSubview(self.characterStatusLabel)
        containerView.addSubview(self.characterSpeciesLabel)
        containerView.addSubview(self.characterTypeLabel)
        containerView.addSubview(self.characterGenderLabel)
        containerView.addSubview(self.characterOriginLabel)
        containerView.addSubview(self.characterLocationLabel)
        
        self.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        self.containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        self.containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        self.containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        self.containerView.heightAnchor.constraint(equalToConstant: 788).isActive = true
        
        self.characterImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        self.characterImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.characterNameLabel.topAnchor.constraint(equalTo: self.characterImageView.bottomAnchor, constant: 8).isActive = true
        self.characterNameLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterNameLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.characterStatusLabel.topAnchor.constraint(equalTo: self.characterNameLabel.bottomAnchor, constant: 16).isActive = true
        self.characterStatusLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterStatusLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterStatusLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.characterSpeciesLabel.topAnchor.constraint(equalTo: self.characterStatusLabel.bottomAnchor, constant: 8).isActive = true
        self.characterSpeciesLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterSpeciesLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterSpeciesLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.characterTypeLabel.topAnchor.constraint(equalTo: self.characterSpeciesLabel.bottomAnchor, constant: 8).isActive = true
        self.characterTypeLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterTypeLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterTypeLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.characterGenderLabel.topAnchor.constraint(equalTo: self.characterTypeLabel.bottomAnchor, constant: 8).isActive = true
        self.characterGenderLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterGenderLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterGenderLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.characterOriginLabel.topAnchor.constraint(equalTo: self.characterGenderLabel.bottomAnchor, constant: 8).isActive = true
        self.characterOriginLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor,constant: 24).isActive = true
        self.characterOriginLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterOriginLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.characterLocationLabel.topAnchor.constraint(equalTo: self.characterOriginLabel.bottomAnchor, constant: 8).isActive = true
        self.characterLocationLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 24).isActive = true
        self.characterLocationLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -24).isActive = true
        self.characterLocationLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: Public Methods
    func setupView(characterImage: UIImage? = nil,
                   nameAttributedText: NSAttributedString,
                   statusAttributedText: NSAttributedString,
                   speciesAttributedText: NSAttributedString,
                   typeAttributedText: NSAttributedString,
                   genderAttributedText: NSAttributedString,
                   originAttributedText: NSAttributedString,
                   locationAttributedText: NSAttributedString) {
        
        if let characterImage = characterImage {
            self.characterImageView.image = characterImage
        }
        
        self.characterNameLabel.attributedText = nameAttributedText
        self.characterStatusLabel.attributedText = statusAttributedText
        self.characterSpeciesLabel.attributedText = speciesAttributedText
        self.characterTypeLabel.attributedText = typeAttributedText
        self.characterGenderLabel.attributedText = genderAttributedText
        self.characterOriginLabel.attributedText = originAttributedText
        self.characterLocationLabel.attributedText = locationAttributedText
    }
}

