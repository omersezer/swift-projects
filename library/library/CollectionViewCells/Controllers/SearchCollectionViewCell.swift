//
//  SearchCollectionViewCell.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(movie: MovieDetailModel?) {
        viewMain.layer.cornerRadius = 6
        ivMovie.layer.cornerRadius = 6
        ivMovie.dropShadow()
        ivMovie.kf.setImage(with: URL(string: movie?.artworkUrl100 ?? ""))
        lblMovieName.text = movie?.trackName ?? ""
    }

}
