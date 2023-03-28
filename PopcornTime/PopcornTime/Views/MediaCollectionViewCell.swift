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
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    // set the poster in the cache
    public func configure(with poster: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") else {return}
        print(url)
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
