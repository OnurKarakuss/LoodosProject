//
//  Api.swift
//  LoodosProject
//
//  Created by Onur Karakuş on 18.08.2019.
//  Copyright © 2019 Onur Karakuş. All rights reserved.
//

import Alamofire

enum Api: URLRequestConvertible {
    
    static let baseUrl = K.baseUrl
    
    case search(title: String)
    case movieDetail(movieName: String)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case  .search, .movieDetail:
                return .get
            }
        }
        
        let params: ([String:Any]?) = {
            
            switch self {
            case .search:
                return nil
            case .movieDetail:
                return nil
            }
        }()
        
        let url: URL = {
            
            let relativePath: String?
            //&apikey\(apikey)
            switch self {
            case .search(let s):
                relativePath = "/?s=\(s)&apikey=29235896"
            case .movieDetail(let t):
                relativePath = "/?t=\(t)&apikey=29235896"
            }
            
            var url = URL(string: Api.baseUrl)!
            if let relativePath = relativePath {
                url = URL(string: (Api.baseUrl + relativePath))!
            }
            
            return url
            
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("Keep-Alive", forHTTPHeaderField: "Connection")
        
        let encoding: ParameterEncoding
        
        switch self {
        case  .search, .movieDetail:
            
            encoding = JSONEncoding.default
        }
        return try encoding.encode(urlRequest, with: params)
    }
}
