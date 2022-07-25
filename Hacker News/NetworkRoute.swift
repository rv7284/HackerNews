//
//  NetworkRoute.swift
//  Jobs
//
//  Created by Ravi Goswami on 21/07/22.
//

import Foundation

private let baseUrl = "https://hacker-news.firebaseio.com/v0/"

enum ApiRoute {
    case topstories
    case item(Int)
    case userInfo(String)
    
    private var endPoint: String {
        switch self {
        case .topstories:
            return "topstories.json"
        case .item(let id):
            return "item/\(id).json"
        case .userInfo(let userId):
            return "user/\(userId).json"
        }
    }
    
    private var url: String {
        return baseUrl + self.endPoint
    }
    
    private var method: String {
        switch self {
        case .topstories, .item(_), .userInfo(_):
            return "GET"
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        return request
    }
}
