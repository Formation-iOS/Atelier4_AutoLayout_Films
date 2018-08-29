//
//  Movie.swift
//  Atelier1_Parsing
//
//  Created by CedricSoubrie on 12/10/2017.
//  Copyright © 2017 CedricSoubrie. All rights reserved.
//

import UIKit

class Movie: NSObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    var title: String = ""
    var overview: String = ""
    var voteAverage: Float = 0.0
    var releaseDate : Date = Date() // The movie DB format : "2017-09-05"
    var posterPath: String = ""
    var backdropPath: String? = ""
    
    override var description: String {
        return "\(title) - (\(voteAverage)/10) - \(releaseDate)"
    }
    
    static func movieList () -> [Movie] {
        if let jsonData = FileManager.jsonData(fromJSONFile: "BestMovie") {
            let decoder = JSONDecoder()
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-mm-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormater)
            return try! decoder.decode ([Movie].self, from: jsonData)
        }
        else {
            return []
        }
        
    }
    
    var image : UIImage? {
        let imageName = String(self.posterPath.dropFirst())
        return UIImage(named:imageName) ?? UIImage(named:"NoImage")
    }
    
    var landscapeImage : UIImage? {
        if let backdropPath = backdropPath {
            let imageName = String(backdropPath.dropFirst())
            return UIImage(named:imageName) ?? UIImage(named:"NoImage")
        } else {
            return image
        }
    }
}
