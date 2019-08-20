//
//  DetailModel.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Foundation

struct DetailModel: Codable {
    
    let Title: String?
    let Year: String?
    let Rated: String?
    let Released: String?
    let Runtime: String?
    let Genre: String?
    let Director: String?
    let Writer: String?
    let Actors: String?
    let Plot: String?
    let Language: String?
    let Country: String?
    let Awards: String?
    let Poster: String?
    let Ratings: [RatingModel]?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let DVD: String?
    let BoxOffice: String?
    let Production: String?
    let Website: String?
    let Response: String?
    
    enum CodingKeys : String,CodingKey{
        case Title
        case Year
        case Rated
        case Released
        case Runtime
        case Genre
        case Director
        case Writer
        case Actors
        case Plot
        case Language
        case Country
        case Awards
        case Poster
        case Ratings
        case Metascore
        case imdbRating
        case imdbVotes
        case imdbID
        case DVD
        case BoxOffice
        case Production
        case Website
        case Response
    }
}
