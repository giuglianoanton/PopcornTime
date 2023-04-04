//
//  Data.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import Foundation

// titles for sections in the What's New
let sectionsTitles = ["Trending Today", "Trending This Week", "Upcoming", "Popular", "Top Rated"]

// searching keys
let searchingKeys = [
    "3/trending/movie/day",
    "3/trending/movie/week",
    "3/movie/upcoming",
    "3/movie/popular",
    "3/movie/top_rated",
]

// 4 cases for 4 sections we have in the whatsnew
enum Sections: Int{
    case TrendingToday = 0
    case TrendingThisWeek = 1
    case Upcoming = 2
    case Popular = 3
    case TopRated = 4
}

