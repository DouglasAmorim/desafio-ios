//
//  CharacterInfoResponse.swift
//  desafio-ios
//
//  Created by Douglas Amorim on 22/07/23.
//

import Foundation

class CharacterInfoResponse: Codable, Equatable {
    private var id: Int?
    private var name: String?
    private var status: String?
    private var species: String?
    private var type: String?
    private var gender: String?
    private var origin: BrieflyLocationResponse?
    private var location: BrieflyLocationResponse?
    private var image: String?
    private var episode: [String]?
    private var url: String?
    private var created: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
    
    static func == (lhs: CharacterInfoResponse, rhs: CharacterInfoResponse) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.status == rhs.status &&
        lhs.species == rhs.species &&
        lhs.type == rhs.type &&
        lhs.gender == rhs.gender &&
        lhs.origin == rhs.origin &&
        lhs.location == rhs.location &&
        lhs.image == rhs.image &&
        lhs.episode == rhs.episode &&
        lhs.url == rhs.url &&
        lhs.created == rhs.created
    }
    
    // MARK: Public Methods
    
    func getId() -> Int? {
        return id
    }
    
    func getName() -> String? {
        return name
    }
    
    func getStatus() -> String? {
        return status
    }
    
    func getSpecies() -> String? {
        return species
    }
    
    func getType() -> String? {
        return type
    }
    
    func getGender() -> String? {
        return gender
    }
    
    func getOrigin() -> BrieflyLocationResponse? {
        return origin
    }
    
    func getLocation() -> BrieflyLocationResponse? {
        return location
    }
    
    func getImage() -> String? {
        return image
    }

    func getEpisode() -> [String]? {
        return episode
    }
    
    func getUrl() -> String? {
        return url
    }
    
    func getCreated() -> String? {
        return created
    }
    
    func setId(id: Int) {
        self.id = id
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setStatus(status: String) {
        self.status = status
    }
    
    func setSpecies(species: String) {
        self.species = species
    }
    
    func setType(type: String) {
        self.type = type
    }
    
    func setGender(gender: String) {
        self.gender = gender
    }
    
    func setOrigin(origin: BrieflyLocationResponse) {
        self.origin = origin
    }
    
    func setLocation(location: BrieflyLocationResponse) {
        self.location = location
    }
    
    func setImage(image: String) {
        self.image = image
    }

    func setEpisode(episodes: [String]) {
        self.episode = episodes
    }
    
    func setUrl(url: String) {
        self.url = url
    }
    
    func setCreated(created: String) {
        self.created = created
    }
}
