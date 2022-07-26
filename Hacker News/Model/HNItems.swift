//
//  HNItems.swift
//  Hacker News
//
//  Created by Ravi on 25/07/22.
//

import Foundation

struct HNResponse: Codable {
    let hits: [HNItem]
    let nbHits, page, nbPages, hitsPerPage: Int
    let exhaustiveNbHits, exhaustiveTypo: Bool
    let query, params: String
    let processingTimeMS: Int
}

// MARK: - HNItem
struct HNItem: Codable, Hashable {
    
    
    static func == (lhs: HNItem, rhs: HNItem) -> Bool {
        return lhs.objectID == rhs.objectID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(objectID)
    }
    
    var createdAt: Date? = Date()
    let title: String?
    let url: String?
    let author: String
    let points: Int?
    let storyText: String?
    let commentText: String?
    let numComments: Int?
//    let storyID, storyTitle, storyURL: JSONNull?
    let storyURL: String?
    let parentID: Int?
    let createdAtI: Int
    let relevancyScore: Int?
    let tags: [String]
    let objectID: String
    let highlightResult: HighlightResult

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case numComments = "num_comments"
//        case storyID = "story_id"
//        case storyTitle = "story_title"
        case storyURL = "story_url"
        case parentID = "parent_id"
        case createdAtI = "created_at_i"
        case relevancyScore = "relevancy_score"
        case tags = "_tags"
        case objectID
        case highlightResult = "_highlightResult"
    }
    
    static let sample: HNItem = try! JSONDecoder().decode(HNItem.self, from: """
                                                      {
                                                          "created_at": 1658765112.623966,
                                                          "title": "Stephen Hawking has died",
                                                          "url": "http://www.bbc.com/news/uk-43396008",
                                                          "author": "Cogito",
                                                          "points": 6015,
                                                          "num_comments": 436,
                                                          "created_at_i": 1520999430,
                                                          "relevancy_score": 8012,
                                                          "_tags": [
                                                              "story",
                                                              "author_Cogito",
                                                              "story_16582136"
                                                          ],
                                                          "objectID": "16582136",
                                                          "_highlightResult": {
                                                              "title": {
                                                                  "value": "Stephen Hawking has died",
                                                                  "matchLevel": "none",
                                                                  "matchedWords": []
                                                              },
                                                              "url": {
                                                                  "value": "http://www.bbc.com/news/uk-43396008",
                                                                  "matchLevel": "none",
                                                                  "matchedWords": []
                                                              },
                                                              "author": {
                                                                  "value": "Cogito",
                                                                  "matchLevel": "none",
                                                                  "matchedWords": []
                                                              }
                                                          }
                                                      }
""".data(using: .utf8)!)
}

// MARK: - HighlightResult
struct HighlightResult: Codable {
    let title, url: Author?
    let author: Author
    let storyText: Author?

    enum CodingKeys: String, CodingKey {
        case title, url, author
        case storyText = "story_text"
    }
}

// MARK: - Author
struct Author: Codable {
    let value: String
    let matchLevel: MatchLevel
//    let matchedWords: [JSONAny]
}

enum MatchLevel: String, Codable {
    case none = "none"
}
