//
//  Movie.swift
//  Netflex Clone
//
//  Created by ChuantaiHu on 2023-03-03.
//

import Foundation

struct TrendingTitleResponse:Codable {
    let results:[Title]
}

struct Title:Codable {
    let id:Int
    let media_type:String?
    let original_name:String?
    let original_title:String?
    let poster_path:String?
    let overview:String?
    let vote_count:Int
    let release_date:String?
    let vote_average:Double
}

/*
 adult = 0;
 "backdrop_path" = "/r7Dfg9aRZ78gJsmDlCirIIlNH3d.jpg";
 "genre_ids" =             (
     18
 );
 id = 785084;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "The Whale";
 overview = "A reclusive English teacher suffering from severe obesity attempts to reconnect with his estranged teenage daughter for one last chance at redemption.";
 popularity = "738.707";
 "poster_path" = "/jQ0gylJMxWSL490sy0RrPj1Lj7e.jpg";
 "release_date" = "2022-12-09";
 title = "The Whale";
 video = 0;
 "vote_average" = "7.952";
 "vote_count" = 661;
},
     {
 adult = 0;
 "backdrop_path" = "/sANUefL2v8VI6fSfK3gWAG3XBt4.jpg";
 "genre_ids" =             (
     27,
     9648,
     53
 );
 id = 631842;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "Knock at the Cabin";
 overview = "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.";
 popularity = "4112.616";
 "poster_path" = "/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg";
 "release_date" = "2023-02-01";
 title = "Knock at the Cabin";
 video = 0;
 "vote_average" = "6.523";
 "vote_count" = 674;
 */
