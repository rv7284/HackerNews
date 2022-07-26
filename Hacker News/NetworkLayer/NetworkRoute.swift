//
//  NetworkRoute.swift
//  Jobs
//
//  Created by Ravi Goswami on 21/07/22.
//

import Foundation

//private let baseUrl = "https://hacker-news.firebaseio.com/v0/"
private let baseUrl = "http://hn.algolia.com/api/v1/"

private var urlPoint: String {
    let showNewsBy = UserDefaults.standard.string(forKey: "displayOption") ?? "Date"
    let point = showNewsBy  == "Date" ? "search_by_date" : "search"
    return point
}

enum ApiRoute {
    case getStories(page: Int, tag: String)
    case getComment(id: String)
    
    private var endPoint: String {
        switch self {
        case .getStories(let page, let tag):
            return "\(urlPoint)?page=\(page)&tags=\(tag)"
        case .getComment(let id):
            return "\(urlPoint)?tags=comment,story_\(id)"
        }
    }
    
    private var url: String {
        return baseUrl + self.endPoint
    }
    
    private var method: String {
        switch self {
        case .getStories(_, _), .getComment(_):
            return "GET"
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        return request
    }
}
