//
//  NewsViewModel.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    var newIds = [Int]()
    @Published var newsItems = [NewsItem]()
    var page = 1
    
    private let pageSize = 10
    private var isLoading = false
    
    func getTopNewIds() {
        NetworkManager.request(.topstories, model: [Int].self) { result in
            switch result {
            case .success(let stories):
                self.newIds = stories
                self.getItems()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNextPageIds() -> [Int]? {
        let startIndex = (page - 1) * pageSize
        if startIndex >= (newIds.count - 1) {
            return nil
        }
        var endIndex = (page * pageSize) - 1
        
        if endIndex >= (newIds.count - 1) {
            endIndex = newIds.count - 1
        }
        return Array(newIds[startIndex...endIndex])
    }
    
    func getItems() {
        guard let ids = self.getNextPageIds(), !isLoading else {return}
        var items = [NewsItem]()
        let group = DispatchGroup()
        print("Getting news items for page: ", page)
        isLoading = true
        for id in ids {
            group.enter()
            NetworkManager.request(.item(id), model: NewsItem.self) { result in
                switch result {
                case .success(let item):
                    items.append(item)
                case .failure(let error):
                    print(error)
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.page += 1
            self.newsItems.append(contentsOf: items)
            self.isLoading = false
        }
    }
}
