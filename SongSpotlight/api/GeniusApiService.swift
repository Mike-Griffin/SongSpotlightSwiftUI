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
    func fetch<T: Codable>(request: String, completion: @escaping (Result<T, Error>) -> ()) {
        let urlString = "\(apiEndpoint)\(request)"
        print(urlString)
        guard let searchUrl = URL(string: urlString) else {
            print("Failed to build URL")
            debugPrint(urlString)
            return
        }
        let headers : HTTPHeaders = [
            "Authorization": "Bearer \(token)",
        ]
        
        let response = AF.request(searchUrl, headers: headers).validate(statusCode: 200..<300).validate(contentType: ["application/json"])
        response.responseDecodable(of: T.self) { result in
            switch result.result {
            case .success(let data):
                    completion(.success(data))
            case .failure(let error):
                print("Failed genius search")
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }

}
