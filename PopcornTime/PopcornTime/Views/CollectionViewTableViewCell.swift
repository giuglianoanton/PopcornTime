//
//  CollectionViewTableViewCell.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    
    var movies: [Media] = [Media]()
    
    private let collectionView: UICollectionView = {
        
        // set the layout of the collection view
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 166, height: 287)
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
    
    
    
//    public func configure(with movies: [Media]){
//        self.movies = movies
//        DispatchQueue.main.async {[weak self] in
//            self?.collectionView.reloadData()
//        }
//    }
    
    /*
     override func awakeFromNib() {
     super.awakeFromNib()
     @@ -33,3 +55,17 @@ class CollectionViewTableViewCell: UITableViewCell {
     }*/
    
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    // set the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as? MediaCollectionViewCell else {
            return UICollectionViewCell()
        }
        // call the configuration for the cache stuff
        guard let movieModel = movies[indexPath.row].poster_path  else {
            return UICollectionViewCell()
        }
        cell.configure(with: movieModel)
        
        cell.backgroundColor = .systemMint
        return cell
    }
    // number of the cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
}
