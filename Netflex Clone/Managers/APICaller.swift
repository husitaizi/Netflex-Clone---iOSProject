//
//  File.swift
//  Netflex Clone
//
//  Created by ChuantaiHu on 2023-03-03.

/**
 This is the test version of source Conrtol Git
 */
//

import Foundation

struct Constants {
    static let API_KEY = "your_google_api_key"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "your_youtube_api_key"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError:Error{
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self,from:data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
          
        }
        task.resume()
    }// end of getTrendingMovies
    
    
    func getTrendingTvs(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }// end ofgetTrendingTvs
    
    func getUpcomingMovies(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }// end getUpcomingMovies
    
    //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
    
    func getPopularMovies(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }// end getPopularMovies
    //https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1
    
    func getTopRatedMovies(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }// end getTopRatedMovies
    //https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    
    //https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
    func getDiscoverMovies(completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    //https://api.themoviedb.org/3/search/collection?api_key=<<api_key>>&language=en-US&page=1
    //https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
    func search(with query:String, completion:@escaping (Result<[Title],Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        
        guard let  url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    /*
     GET https://youtube.googleapis.com/youtube/v3/search?q=Harry&key=[YOUR_API_KEY] HTTP/1.1

     Authorization: Bearer [YOUR_ACCESS_TOKEN]
     Accept: application/json

     */
    func getMovie(with query:String, completion:@escaping (Result<VideoElement,Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
            } catch{
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}













