//
//  Album.swift
//  Album
//
//  Created by Hayden Hastings on 9/30/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

class Album: Codable {
    
    var name: String
    var artist: String
    var identifier: UUID
    var coverArt: [URL]
    var genres: [String]
    var songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case name
        case artist
        case id
        case coverArt
        case genres
        case songs
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let artist = try container.decode(String.self, forKey: .artist)
        let identifier = try container.decode(UUID.self, forKey: .id)
        
        var coverArt: [URL] = []
        
        if container.contains(.coverArt) {
            var coverArtArray = try container.nestedUnkeyedContainer(forKey: .coverArt)
            while !coverArtArray.isAtEnd {
                let coverArtDictionary = try coverArtArray.nestedContainer(keyedBy: CodingKeys.CoverArtKeys.self)
                let url = try coverArtDictionary.decode(URL.self, forKey: .url)
                
                coverArt.append(url)
            }
        }
        
        var genres: [String] = []
        
        if container.contains(.genres) {
            var genersContainer = try container.nestedUnkeyedContainer(forKey: .genres)
            while !genersContainer.isAtEnd {
                let genre = try genersContainer.decode(String.self)
                genres.append(genre)
            }
        }
        
        var songs: [Song] = []
        
        if container.contains(.songs) {
            
            var songsContainer = try container.nestedUnkeyedContainer(forKey: .songs)
            
            while !songsContainer.isAtEnd {
                let song = try songsContainer.decode(Song.self)
                songs.append(song)
            }
        }
        self.name = name
        self.artist = artist
        self.identifier = identifier
        self.coverArt = coverArt
        self.genres = genres
        self.songs = songs
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}

// MARK: - Songs

class Song: Codable {
    
}
