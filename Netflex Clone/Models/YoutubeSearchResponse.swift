//
//  YoutubeSearchResponse.swift
//  Netflex Clone
//
//  Created by ChuantaiHu on 2023-03-08.
//

import Foundation

/**
 items =     (
             {
         etag = "nk-GcXLPp_gecyK9t7tI9GsFsV4";
         id =             {
             kind = "youtube#video";
             videoId = P4NibfAPZN4;
         };
         kind = "youtube#searchResult";
     },
 */
struct YoutubeSearchResponse:Codable {
    let items:[VideoElement]
}
struct VideoElement :Codable{
    let id:IdVideoElement
}
struct IdVideoElement:Codable{
    let kind:String
    let videoId:String
}
