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
        
        imageView.frame = CGRect(x: Int(imageView.bounds.origin.x), y: Int(imageView.bounds.origin.y), width: 166, height: 245)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.5
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return imageView
    }()
    
    // the layer under the poster that contains the shadow
    private let underLayer: UIView = {
        let layer = UIView()
        layer.frame = CGRect(x: Int(layer.bounds.origin.x), y: Int(layer.bounds.origin.y), width: 166, height: 287)
        layer.backgroundColor = .white
        layer.layer.cornerRadius = 12.5
        layer.layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.layer.shadowRadius = 3
        layer.layer.shadowColor = UIColor.gray.cgColor
        layer.layer.shadowOpacity = 0.18
        
        return layer
    }()
    
    //title, year
    private let mediaLabels: UIView = {
        let mediaLabels = UIView()
        mediaLabels.frame = CGRect(x: mediaLabels.bounds.origin.x, y: mediaLabels.bounds.origin.y, width: 111, height: 32)
        
        let title = UILabel()
        title.frame = CGRect(x: title.bounds.origin.x, y: title.bounds.origin.y, width: 111, height: 32)
        
        title.textAlignment = .justified
        title.text = "title".capitalized
        title.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        
        mediaLabels.addSubview(title)
        
        let year = UILabel()
        year.frame = CGRect(x: year.bounds.origin.x, y: title.font.pointSize + 2, width: 111, height: 32)
        
        year.textAlignment = .justified
        year.text = "2023"
        year.font = UIFont.systemFont(ofSize: 8, weight: UIFont.Weight.semibold)
        mediaLabels.addSubview(year)
        
        return mediaLabels
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(underLayer)
        underLayer.addSubview(posterImageView)
        mediaLabels.frame = CGRect(x: posterImageView.bounds.origin.x + 20, y: posterImageView.frame.height, width: 111, height: 30)
        underLayer.addSubview(mediaLabels)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //
    override func layoutSubviews() {
        super.layoutSubviews()
        underLayer.frame = contentView.bounds
    }
    
    // set the poster in the cache
    public func configure(with poster: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") else {return}
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
