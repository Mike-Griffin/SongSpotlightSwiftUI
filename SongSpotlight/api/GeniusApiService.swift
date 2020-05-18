//
//  GeniusApiService.swift
//  SongSpotlight
//
//  Created by Mike Griffin on 5/16/20.
//  Copyright © 2020 Mike Griffin. All rights reserved.
//

import Foundation
import Alamofire

let apiEndpoint = "https://api.genius.com/"

public struct GeniusApiService {
    func fetchSearch(query: String, page: Int, completion: @escaping (Result<[SongHit], Error>) -> ()) {
        let searchUrlString = "\(apiEndpoint)search?q=\(query)&per_page=5&page=\(page)"
        guard let searchUrl = URL(string: searchUrlString) else {
            print("Failed to build URL")
            debugPrint(searchUrlString)
            return
        }
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(token)",
        ]
        
        let response = AF.request(searchUrl, headers: headers).validate(statusCode: 200..<300).validate(contentType: ["application/json"])
        response.responseDecodable(of: SearchResult.self) { result in
            switch result.result {
            case .success(let data):
                let hits = data.response.hits
                if hits.count > 0 {
                    completion(.success(hits))
                } else {
                    print("No results")
                }
            case .failure(let error):
                print("Failed genius search")
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
    
    func fetchSong(id: Int, completion: @escaping (Result<Song, Error>) -> ()) {
        let songUrlString = "\(apiEndpoint)songs/\(id)"
        print(songUrlString)
        guard let url = URL(string: songUrlString) else {
            print("Failed to build URL")
            debugPrint(songUrlString)
            return
        }
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(token)",
        ]
        
        let response = AF.request(url, headers: headers).validate(statusCode: 200..<300).validate(contentType: ["application/json"])
        response.responseDecodable(of: SongIdResult.self) { result in
            switch result.result {
            case .success(let data):
                completion(.success(data.response.song))
               
            case .failure(let error):
                print("Failed genius search")
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }

}
