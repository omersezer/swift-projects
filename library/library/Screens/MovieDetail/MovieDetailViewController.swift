//
//  MovieDetailViewController.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit

protocol MovieDetailViewInputs: AnyObject {
    func prepareUI()
    func onMovieDetailReady(movie: MovieDetailModel?)
    func onError(err: BaseErrorModel)
}

protocol MovieDetailViewOutputs: AnyObject {
    func viewDidLoad()
}

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var ivHeader: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblMovieDetail: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    
    internal var presenter: MovieDetailViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MovieDetailViewController: MovieDetailViewInputs {
    func prepareUI() {
        // MARK: scrollView
        scrollView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0) // 300 is ivHeader's height
    }
    
    func onMovieDetailReady(movie: MovieDetailModel?) {
        ivHeader.kf.setImage(with: URL(string: movie?.artworkUrl100 ?? ""))
        lblMovieName.text = movie?.trackName ?? ""
        lblMovieDetail.text = movie?.longDescription ?? ""
        lblDirector.text = movie?.artistName ?? ""
        lblGenres.text = movie?.primaryGenreName ?? ""
    }
    
    func onError(err: BaseErrorModel) {
        AlertUtil.showStandardAlert(parentController: self, message: APIErrorGenerator().generateError(error: err))
    }
}

extension MovieDetailViewController: Viewable { }
