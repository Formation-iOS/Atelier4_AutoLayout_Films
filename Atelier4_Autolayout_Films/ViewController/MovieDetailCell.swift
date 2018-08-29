//
//  MovieDetailCell.swift
//  Films
//
//  Created by Claire Reynaud on 13/10/2017.
//  Copyright © 2017 Claire Reynaud EIRL. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func fill(with movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = String(format: "Note : %.1f/10", movie.voteAverage)
        descriptionLabel.text = movie.overview
        customImageView.image = movie.landscapeImage
    }
}
