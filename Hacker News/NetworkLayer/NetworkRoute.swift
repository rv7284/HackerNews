//
//  NetworkRoute.swift
//  Jobs
//
//  Created by Ravi Goswami on 21/07/22.
//

import Foundation

//private let baseUrl = "https://hacker-news.firebaseio.com/v0/"
private let baseUrl = "http://hn.algolia.com/api/v1/"

enum ApiRoute {
    case getActiveStories
    case getLatestStories(page: Int)
    
    private var endPoint: String {
        switch self {
        case .getActiveStories:
            return "search"
        case .getLatestStories(let page):
            return "search_by_date?page=\(page)"
        }
    }
    
    private var url: String {
        return baseUrl + self.endPoint
    }
    
    private var method: String {
        switch self {
        case .getActiveStories, .getLatestStories:
            return "GET"
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        return request
    }
}
