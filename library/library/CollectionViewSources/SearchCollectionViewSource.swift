//
//  SearchCollectionViewSource.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit

final class SearchCollectionViewSource: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let presenter: SearchPresenter
    
    init(presenter: SearchPresenter) {
        self.presenter = presenter
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.entities.movies?.sectionedMovies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.entities.movies?.sectionedMovies?[section]?.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.updateCell(movie: presenter.entities.movies?.results?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width / 2
        return CGSize(width: cellWidth, height: cellWidth * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.onMovieSelected(movie: presenter.entities.movies?.sectionedMovies?[indexPath.section]?.movies?[indexPath.row])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (presenter.entities.movies?.sectionedMovies?[indexPath.section]?.movies?.count ?? 0) - 1 && (presenter.entities.movies?.resultCount ?? 0) > 24 {
            let pageNumber: Int = (presenter.entities.movies?.results?.count ?? 0) / 25 // 25 is pagination limit
            presenter.searchNextPage(pageNumber: pageNumber + 1)
        }
    }
}

