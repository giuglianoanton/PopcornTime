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
        layout.itemSize = CGSize(width: 175, height: 291)
        layout.scrollDirection = .horizontal
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
        
        return cv
    }()
    
    private let overLayer: UIView = {
        let overLayer = UIView()
        return overLayer
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemIndigo
        contentView.addSubview(collectionView)
        contentView.addSubview(overLayer)
        
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
        
//        layer.shadowOpacity = 0.18
//        layer.shadowOffset = CGSize(width: 0, height: 4)
//        layer.shadowRadius = 8
//        layer.shadowColor = UIColor.black.cgColor
//        layer.masksToBounds = false
//        overLayer.frame.size = CGSize(width: 166, height: 287)
//        overLayer.frame = contentView.bounds
//        overLayer.frame = CGRect(x: Int(overLayer.bounds.origin.x), y: Int(overLayer.bounds.origin.y), width: 166, height: 287)
//        overLayer.backgroundColor = .systemRed
//        overLayer.layer.cornerRadius = 12.5
//        overLayer.layer.masksToBounds = true
        
        DispatchQueue.main.async {[weak self] in
            self?.collectionView.reloadData()
        }
        
        //        collectionView.showsHorizontalScrollIndicator = false
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
        // call the configuration for the cache stuff
        guard let movieModel = movies[indexPath.row].poster_path  else {
            return UICollectionViewCell()
        }
        
        
        cell.configure(with: movieModel)
//        cell.backgroundColor = .systemMint
//        cell.layer.cornerRadius = 12.5
//        cell.layer.shadowOpacity = 0.5
//        cell.layer.shadowOffset = CGSize(width: 10, height: 10)
//        cell.layer.shadowRadius = 2
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.masksToBounds = false
        
        return cell
    }
    // number of the cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
}
