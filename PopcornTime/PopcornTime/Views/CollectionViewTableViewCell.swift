//
//  CollectionViewTableViewCell.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

// create the protocol
protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, movieSingleton: DetailMovieSingleton)
}

class CollectionViewTableViewCell: UITableViewCell {
    
    var movies: [Media] = []
    
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    static let identifier = "CollectionViewTableViewCell"
        
    private let collectionView: UICollectionView = {
        
        // set the layout of the collection view
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 166, height: 291)
        layout.scrollDirection = .horizontal
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
        
        return cv
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemIndigo
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //set frame for the cell
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
        DispatchQueue.main.async {[weak self] in
            self?.collectionView.reloadData()
        }
        
//        collectionView.showsHorizontalScrollIndicator = false
    }
    
    // make sure that the heart in the card is fill if tapped on heart from detailed view
    override func didMoveToWindow() {
        collectionView.reloadData()
    }
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//                @@ -33,3 +55,17 @@ class CollectionViewTableViewCell: UITableViewCell {
//                }
//
//    }
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // set the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as? MediaCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movieModel = movies[indexPath.row]
        if let poster = movies[indexPath.row].poster_path {
            cell.configure(with: poster)
        }
        cell.configureLabels(with: movies[indexPath.row])
        cell.movie = movieModel
        
        if MoviesSingleton.sharedInstance.movies.contains(where: {$0.id == movies[indexPath.row].id}){
            cell.heartButton.isSelected = true
        } else{
            cell.heartButton.isSelected = false
        }
        return cell
    }
    
    // number of the cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // once a cell is selected, it has to be deselected too
        collectionView.deselectItem(at: indexPath, animated: true)
        // save the selected movie
        DetailMovieSingleton.sharedInstance.didSelect(movie: movies[indexPath.row])
        // delegate to that cell selected
        delegate?.collectionViewTableViewCellDidTapCell(self, movieSingleton: DetailMovieSingleton.sharedInstance)
    }
    
}
