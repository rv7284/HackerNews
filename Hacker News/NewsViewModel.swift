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
    var page = 0
    
    private let pageSize = 10
    private var isLoading = false
    
    func getStories() {
        NetworkManager.request(.getLatestStories(page: page), model: HNResponse.self) { result in
            switch result {
            case .success(let response):
                self.page += 1
                DispatchQueue.main.async {
                    let newData = response.hits.filter({$0.title != nil})
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
