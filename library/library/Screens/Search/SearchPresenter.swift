//
//  SearchPresenter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import SVProgressHUD

typealias SearchPresenterDependencies = (
    interactor: SearchInteractor,
    router: SearchRouterOutput
)

final class SearchPresenter: Presenterable {
    internal var entities: SearchEntities
    private weak var view: SearchViewInputs?
    let dependencies: SearchPresenterDependencies
    
    init(entities: SearchEntities,
         dependencies: SearchPresenterDependencies, view: SearchViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
    
    func setCollectionViewSource() {
        entities.source = SearchCollectionViewSource(presenter: self)
        view?.onCollectionViewSourceReady(source: entities.source)
    }
    
    func searchNextPage(pageNumber: Int) {
        SVProgressHUD.show()
        dependencies.interactor.searchMovie(searchedText: entities.searchedText ?? "", pageNumber: pageNumber, type: entities.selectedType)
    }
    
    func onMovieSelected(movie: MovieDetailModel?) {
        dependencies.router.presentMovieDetail(movie: movie)
    }
}

extension SearchPresenter: SearchViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI() {
        view?.prepareUI()
    }
    
    func onSearchTextChanged(searchedText: String) {
        entities.searchedText = searchedText
        if searchedText.count > 3 {
            SVProgressHUD.show()
            dependencies.interactor.searchMovie(searchedText: searchedText, type: entities.selectedType)
        } else {
            view?.resetView()
        }
    }
    
    func onSegmentedControlChanged(index: Int) {
        entities.selectedType = SearchTypes(index: index)
        SVProgressHUD.show()
        dependencies.interactor.searchMovie(searchedText: entities.searchedText ?? "", type: entities.selectedType)
    }
}

extension SearchPresenter: SearchInteractorOutputs {
    func onMoviesSearched(movies: MoviesModel?) {
        SVProgressHUD.dismiss()
        if movies?.results?.count ?? 0 > 0 {
            entities.movies = movies
            setCollectionViewSource()
        } else {
            view?.showNoResult()
        }
    }
    
    func onNextPageFetched(movies: MoviesModel?) {
        SVProgressHUD.dismiss()
        entities.movies?.appendNextPage(movies: movies?.results)
        setCollectionViewSource()
    }
    
    func onError(error: String) {
        SVProgressHUD.dismiss()
        view?.onError(err: error)
    }
}
