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
    
    var movie: Media?
    
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
        layer.layer.shadowColor = UIColor.black.cgColor
        layer.layer.shadowOpacity = 0.18
        
        return layer
    }()
    
    //set the view that contains the title and the year labels
    private let mediaLabels: UIView = {
        let mediaLabels = UIView()
        mediaLabels.frame = CGRect(x: mediaLabels.bounds.origin.x, y: mediaLabels.bounds.origin.y, width: 111, height: 32)
        return mediaLabels
    }()
    
    // title
    private let title: UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: title.bounds.origin.x, y: title.bounds.origin.y, width: 111, height: 32)
        
        title.textAlignment = .justified
        title.text = "title".capitalized
        title.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        return title
    }()
    
    //year
    private let year: UILabel = {
        
        let year = UILabel()
        
        year.textAlignment = .justified
        year.text = "2023"
        year.font = UIFont.systemFont(ofSize: 8, weight: UIFont.Weight.semibold)
        
        return year
    }()
    
    
    
    //heart button
    let heartButton: UIButton = {
        let button = UIButton()
        
        // icon size configuration
        let iconSize = UIImage.SymbolConfiguration(pointSize: 21, weight: .bold)

        button.setImage(UIImage(systemName: "heart", withConfiguration: iconSize), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill", withConfiguration: iconSize), for: .selected)
        
        button.titleLabel?.tintColor = UIColor.tintColor
        
        button.addTarget(self, action: #selector(saveAsFavourite), for: .touchDown)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(underLayer)
        underLayer.addSubview(posterImageView)
        mediaLabels.frame = CGRect(x: underLayer.bounds.origin.x + 12, y: underLayer.bounds.origin.y + 243 , width: 111, height: 30)
        underLayer.addSubview(mediaLabels)
        mediaLabels.addSubview(title)
        year.frame = CGRect(x: year.bounds.origin.x, y: title.font.pointSize + 2, width: 111, height: 32)
        
        mediaLabels.addSubview(year)
        heartButton.frame = CGRect(x: underLayer.bounds.origin.x + 105, y: underLayer.bounds.origin.y + 230, width: 75, height: 75)
        //        configureButton()
        underLayer.addSubview(heartButton)
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
        //        print(url)
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
    // set the labels
    public func configureLabels(with movie: Media) {
        title.text = movie.title?.capitalized
        if let release = movie.release_date{
            // only want the year
            year.text = String(release.prefix(4))
        }
    }
    
    
    @objc func saveAsFavourite(sender: UIButton!){
        sender.isSelected.toggle()
        if let movie = movie{
            MoviesSingleton.sharedInstance.didTapHeart(movie: movie)
        }
    }
}

