//
//  MediaCollectionViewCell.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import UIKit

// a thir part library that allows to store in the cache the images you fetch from the api
import SDWebImage

class MediaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MediaCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: Int(imageView.bounds.origin.x), y: Int(imageView.bounds.origin.y), width: 166, height: 287)
        imageView.layer.cornerRadius = 12.5
        
        return imageView
    }()
    
    private let overLayer: UIView = {
        let overLayer = UIView()
        overLayer.frame = CGRect(x: Int(overLayer.bounds.origin.x), y: Int(overLayer.bounds.origin.y), width: 166, height: 287)
        overLayer.layer.cornerRadius = 12.5
        overLayer.layer.shadowOpacity = 0.18
        overLayer.layer.shadowOffset = CGSize(width: 4, height: 4)
        overLayer.layer.shadowRadius = 2.5
        overLayer.layer.shadowColor = UIColor.black.cgColor
        
        return overLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.layer.shadowOpacity = 0.18
//        self.layer.shadowOffset = CGSize(width: 0, height: 4)
//        self.layer.shadowRadius = 8
//        self.layer.shadowColor = UIColor.black.cgColor
//        //        self.layer.masksToBounds = true
//        //        self.layer.cornerRadius = 12.5
//        //        self.layer.maskedCorners = .layerMaxXMaxYCorner
        contentView.addSubview(overLayer)
        overLayer.addSubview(posterImageView)
//                contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    //
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        posterImageView.layer.shadowOpacity = 0.6
        //        posterImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        //        posterImageView.layer.shadowRadius = 8
        //        posterImageView.layer.shadowColor = UIColor.black.cgColor
        //
        overLayer.frame = contentView.bounds
//                posterImageView.frame = contentView.bounds
    }
    
    // set the poster in the cache
    public func configure(with poster: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
