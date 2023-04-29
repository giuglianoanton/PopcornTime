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
    private let movieTitle: UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: title.bounds.origin.x, y: title.bounds.origin.y, width: 155, height: 32)
        title.textAlignment = .justified
        title.text = "title".capitalized
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
    private let overview: UILabel = {
        let overview = UILabel()
        overview.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        overview.numberOfLines = 0
        overview.sizeToFit()
        return overview
    }()
    
    
    //set the view that contains the title and the year labels
    private let mediaLabels: UIView = {
        let mediaLabels = UIView()
        return mediaLabels
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        view.backgroundColor = .systemBackground
        view.addSubview(underLayer)
        underLayer.addSubview(posterImageView)
        year.frame = CGRect(x: year.bounds.origin.x, y: movieTitle.font.pointSize + 2, width: 155, height: 32)
        
        mediaLabels.frame = CGRect(x: posterImageView.bounds.origin.x + posterImageView.frame.width + 12, y: posterImageView.bounds.origin.y + 15 , width: 155, height: 100)
        underLayer.addSubview(mediaLabels)
        mediaLabels.addSubview(movieTitle)
        mediaLabels.addSubview(year)
        ratings.frame = CGRect(x: ratings.bounds.origin.x, y: movieTitle.frame.height + year.frame.height + 6, width: 155, height: 32)
        mediaLabels.addSubview(ratings)
        overview.frame = CGRect(x: Int(overview.bounds.origin.x), y: Int(posterImageView.frame.height) + 15, width: Int(view.frame.width) - 60, height: 300)
        overview.backgroundColor = .systemRed
        underLayer.addSubview(overview)
        
        

        
        
        // Do any additional setup after loading the view.
    }
    
    //configure underlayer constraints
    func configureConstraints(){
        underLayer.frame = CGRect(x: view.bounds.origin.x + 30, y: view.bounds.origin.y + 100, width: view.frame.width - 60, height: view.frame.height - 60)
        
        underLayer.topAnchor.constraint(equalTo: view.topAnchor)
        underLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    }
    
    // set the poster in the cache
    public func configure(with movie: Media) {
        
        movieTitle.text = movie.original_title
        if let release = movie.release_date {
            year.text = String(release.prefix(4))
            
        }
        ratings.text = setRatings(vote: movie.vote_average)
        overview.text = movie.overview
        if let poster = movie.poster_path {
            guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") else {return}
            posterImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    // set ratings
    func setRatings(vote: Double) -> String{
        var rounded = (vote / 2).rounded(.toNearestOrEven)
        var ratings = ""
        for x in 1...Int(rounded)  {
            ratings += "★"
        }
        return ratings
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
