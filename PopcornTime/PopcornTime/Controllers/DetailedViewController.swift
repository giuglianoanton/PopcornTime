//
//  DetailedViewController.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/04/23.
//

import UIKit

class DetailedViewController: UIViewController {

    var movie: Media?
    
    private var underLayer: UIView = {
        var layer = UIView()
        return layer
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.frame = CGRect(x: Int(imageView.bounds.origin.x), y: Int(imageView.bounds.origin.y), width: 166, height: 245)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.5
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return imageView
    }()
    
    // title
    private let movieTitle: UITextField = {
        
        let title = UITextField()
        title.textAlignment = .justified
        title.isUserInteractionEnabled = false
        title.contentVerticalAlignment = .top
        title.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        return title
    }()
    
    //year
    private let year: UILabel = {
        
        let year = UILabel()
        year.textAlignment = .justified
        year.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        
        return year
    }()
    
    // ratings
    private let ratings: UILabel = {
        
        let ratings = UILabel()
        ratings.textAlignment = .justified
        ratings.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        
        return ratings
    }()
    
    //overview
    private let overview: UITextField = {
        let overview = UITextField()
        overview.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        overview.isUserInteractionEnabled = false
        overview.contentVerticalAlignment = .top
        return overview
    }()
    
    
    //set the view that contains the title and the year labels
    private let mediaLabels: UIView = {
        let mediaLabels = UIView()
        return mediaLabels
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        underLayer.frame = CGRect(x: view.bounds.origin.x + 30, y: view.bounds.origin.y + 150, width: view.frame.width - 60, height: view.frame.height - 60)
        view.backgroundColor = .systemBackground
        view.addSubview(underLayer)
        
        heartButton.frame = CGRect(x: Int(heartButton.bounds.origin.x) + 120, y: Int(heartButton.bounds.origin.y), width: 30, height: 30)
        
        underLayer.addSubview(posterImageView)
        
        
        
        mediaLabels.frame = CGRect(x: posterImageView.bounds.origin.x + posterImageView.frame.width + 12, y: posterImageView.bounds.origin.y , width: 155, height: 100)
        underLayer.addSubview(mediaLabels)
        movieTitle.frame = CGRect(x: movieTitle.bounds.origin.x, y: movieTitle.bounds.origin.y + heartButton.frame.height, width: 155, height: 70)
        mediaLabels.addSubview(movieTitle)
        year.frame = CGRect(x: year.bounds.origin.x, y: year.bounds.origin.y + 3, width: 155, height: 20)
        mediaLabels.addSubview(year)
        ratings.frame = CGRect(x: ratings.bounds.origin.x, y: movieTitle.frame.height + year.frame.height, width: 155, height: 32)
        mediaLabels.addSubview(ratings)
        mediaLabels.addSubview(heartButton)
        overview.frame = CGRect(x: Int(overview.bounds.origin.x), y: Int(posterImageView.frame.height) + 15, width: Int(view.frame.width) - 60, height: 300)
        underLayer.addSubview(overview)
        

        // Do any additional setup after loading the view.
    }
    
    
    // set the poster in the cache
    public func configure(with movie: Media) {
        let paragraphStyle = NSMutableParagraphStyle()

        movieTitle.attributedText = NSMutableAttributedString(string: movie.title ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        if let release = movie.release_date {
            year.text = String(release.prefix(4))
            
        }
        
        ratings.text = setRatings(vote: movie.vote_average)
        paragraphStyle.lineHeightMultiple = 1.05
        overview.attributedText = NSMutableAttributedString(string: movie.overview ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
 
        if let poster = movie.poster_path {
            guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") else {return}
            posterImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    
    // set ratings
    func setRatings(vote: Double) -> String{
        let rounded = (vote / 2).rounded(.toNearestOrEven)
        var ratings = ""
        for _ in 1...Int(rounded)  {
            ratings += "★"
        }
        return ratings
    }
    
    @objc func saveAsFavourite(sender: UIButton!){
        sender.isSelected.toggle()
        if let movie = DetailMovieSingleton.sharedInstance.movie {
            MoviesSingleton.sharedInstance.didTapHeart(movie: movie)
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
