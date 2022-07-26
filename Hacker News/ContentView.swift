//
//  ContentView.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: NewsViewModel
    @State var showFilter = false
    
    var body: some View {
        NavigationView {
            List(viewModel.newsItems, id: \.self) { item in
                NavigationLink {
                    NewsItemDetailView(item: item)
                } label: {
                    NewsItemView(newsItem: item)
                }
                .onAppear {
                    if viewModel.newsItems.last?.objectID == item.objectID {
                        viewModel.getStories()
                    }
                }
            }
            .navigationTitle("Top Stories")
            .toolbar {
                Button {
                    showFilter.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }

            }
        }
        .sheet(isPresented: $showFilter, content: {
            FilterView()
        })
        .onAppear {
            viewModel.getStories()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NewsViewModel())
    }
}
