//
//  TitleCollectionViewCell.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 07/04/23.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    var movie: Media?
    
    private let mediaLabels: UIView = {
        let mediaLabels = UIView()
        mediaLabels.frame = CGRect(x: mediaLabels.bounds.origin.x, y: mediaLabels.bounds.origin.y, width: UIScreen.main.bounds.width, height: 50)
        return mediaLabels
    }()
    
    // title
    private let title: UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: title.bounds.origin.x, y: title.bounds.origin.y, width: UIScreen.main.bounds.width * (4/5), height: 50)
        
        title.textAlignment = .justified
        title.text = "title".capitalized
        title.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return title
    }()
    //year
    private let year: UILabel = {
        
        let year = UILabel()
        
        year.textAlignment = .justified
        year.text = "2023"
        year.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        
        return year
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mediaLabels)
        mediaLabels.addSubview(title)
        year.frame = CGRect(x: year.bounds.origin.x, y: title.font.pointSize + 2, width: 111, height: 50)
        
        mediaLabels.addSubview(year)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mediaLabels.frame = contentView.bounds.offsetBy(dx: 15, dy: 0)
    }
    // set the labels
    public func configureLabels(with movie: Media) {
        title.text = movie.title?.capitalized
        if let release = movie.release_date{
            // only want the year
            year.text = String(release.prefix(4))
        }
    }
}
