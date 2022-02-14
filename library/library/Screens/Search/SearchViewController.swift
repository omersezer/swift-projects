//
//  SearchViewController.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit
import RxSwift

protocol SearchViewInputs: AnyObject {
    func prepareUI()
    func onCollectionViewSourceReady(source: SearchCollectionViewSource?)
    func resetView()
    func showNoResult()
    func onError(err: String)
}

protocol SearchViewOutputs: AnyObject {
    func viewDidLoad()
    func onSearchTextChanged(searchedText: String)
    func onSegmentedControlChanged(index: Int)
}


class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblNoResult: UILabel!
    
    internal var presenter: SearchViewOutputs?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    func setLogoToNavigationBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "ic_logo")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    @objc func onSegmentedControlChanged(_ sender: UISegmentedControl) {
        presenter?.onSegmentedControlChanged(index: segmentedControl.selectedSegmentIndex)
    }

}

extension SearchViewController: SearchViewInputs {
    func prepareUI() {
        // MARK: navigationBar
        setLogoToNavigationBar()
        
        // MARK: lblEmptyMovieText
        lblNoResult.isHidden = true
        
        // MARK: segmentedControl
        segmentedControl.addTarget(self, action: #selector(onSegmentedControlChanged(_:)), for: .valueChanged)
        
        // MARK: searchBar
        searchBar.tintColor = UIColor.primaryColor
        searchBar.placeholder = "Please enter minimum 3 letters"
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.rx
                .controlEvent(.editingChanged)
                .asObservable()
                .subscribe(onNext: { [weak self] in
                    self?.presenter?.onSearchTextChanged(searchedText: self?.searchBar.text ?? "")
                })
                .disposed(by: disposeBag)
        } else {
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                textfield.rx
                    .controlEvent(.editingChanged)
                    .asObservable()
                    .subscribe(onNext: { [weak self] in
                        self?.presenter?.onSearchTextChanged(searchedText: self?.searchBar.text ?? "")
                    })
                    .disposed(by: disposeBag)
            }
        }
        
        // MARK: collectionView
        collectionView.isHidden = true
        collectionView.keyboardDismissMode = .onDrag
        collectionView.register(UINib(nibName: "SearchHeaderCollectionViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchHeaderCollectionViewCell")
        collectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }
    
    func onCollectionViewSourceReady(source: SearchCollectionViewSource?) {
        lblNoResult.isHidden = true
        collectionView.isHidden = false
        collectionView.delegate = source
        collectionView.dataSource = source
        collectionView.reloadData()
    }
    
    func resetView() {
        lblNoResult.isHidden = true
        collectionView.isHidden = true
    }
    
    func showNoResult() {
        lblNoResult.isHidden = false
        collectionView.isHidden = true
    }
    
    func onError(err: String) {
        AlertUtil.showStandardAlert(parentController: self, message: err)
    }
}

extension SearchViewController: Viewable { }

