//
//  Movie.swift
//  Atelier1_Parsing
//
//  Created by CedricSoubrie on 12/10/2017.
//  Copyright © 2017 CedricSoubrie. All rights reserved.
//

import UIKit

class Movie: NSObject, Codable {
    var title: String = ""
    var overview: String = ""
    var vote_average: Float = 0.0
    var release_date : Date = Date() // The movie DB format : "2017-09-05"
    var poster_path: String = ""
    var backdrop_path: String = ""
    
    override var description: String {
        return "\(title) - (\(vote_average)/10)"
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
        let imageName = String(self.poster_path.dropFirst())
        return UIImage(named:imageName) ?? UIImage(named:"NoImage")
    }
    
    var landscapeImage : UIImage? {
        let imageName = String(self.backdrop_path.dropFirst())
        return UIImage(named:imageName) ?? UIImage(named:"NoImage")
    }
}
