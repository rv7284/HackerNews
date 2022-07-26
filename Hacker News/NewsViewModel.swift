//
//  NewsViewModel.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    var newIds = [Int]()
    @Published var newsItems = [HNItem]()
    @Published var newsComments = [HNItem]()
    var page = 0
    
    private let pageSize = 10
    private var isLoading = false
    
    var tag: String {
        return UserDefaults.standard.string(forKey: "tag") ?? "story"
    }
    
    func resetItems() {
        page = 0
        newsItems.removeAll()
        getStories()
    }
    
    func getComments(forStoryId id: String) {
        NetworkManager.request(.getComment(id: id), model: HNResponse.self) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.newsComments = response.hits
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getStories() {
        NetworkManager.request(.getStories(page: page, tag: tag), model: HNResponse.self) { result in
            switch result {
            case .success(let response):
                self.page += 1
                DispatchQueue.main.async {
                    let newData = response.hits
                    self.newsItems.append(contentsOf: newData)
                    print(self.newsItems.count)
                    if newData.isEmpty {
                        self.getStories()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
