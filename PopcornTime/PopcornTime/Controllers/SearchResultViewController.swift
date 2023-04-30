//
//  SearchResultViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 07/04/23.
//

import UIKit

// create the protocol
protocol SearchResultViewControllerDelegate: AnyObject {
    func SearchResultViewControllerDidTapCell(_ cell: SearchResultViewController, movieSingleton: DetailMovieSingleton)
}
class SearchResultViewController: UIViewController {

    weak var delegate: SearchResultViewControllerDelegate?
    
    
    public var moviesResults = [Media]()
    public let searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 55)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        searchResultsCollectionView.frame = view.bounds
        DispatchQueue.main.async {[weak self] in
            self?.searchResultsCollectionView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesResults.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{
            return UICollectionViewCell()
        }
       
        cell.configureLabels(with: moviesResults[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // once a cell is selected, it has to be deselected too
        collectionView.deselectItem(at: indexPath, animated: true)
        // save the selected movie
        DetailMovieSingleton.sharedInstance.didSelect(movie: moviesResults[indexPath.row])
        // delegate to that cell selected
        delegate?.SearchResultViewControllerDidTapCell(self, movieSingleton: DetailMovieSingleton.sharedInstance)
    }
}
