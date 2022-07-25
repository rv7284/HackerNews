//
//  UserInfo.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import Foundation

struct UserInfo: Codable {
    let about: String
    let created, delay: Int
    let id: String
    let karma: Int
    let submitted: [Int]
}
