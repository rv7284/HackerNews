//
//  NewsItemDetailView.swift
//  Hacker News
//
//  Created by Ravi on 26/07/22.
//

import SwiftUI

struct NewsItemDetailView: View {
    
    @EnvironmentObject var viewModel: NewsViewModel
    let item: HNItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title ?? "N/A")
                .font(.headline)
                .padding()
            Spacer()
            List(viewModel.newsComments, id: \.self) { comment in
                Text(comment.commentText?.decodingHTMLEntities() ?? "")
            }
            .listStyle(.plain)
        }
        .onAppear(perform: {
            viewModel.getComments(forStoryId: item.objectID)
        })
        .frame(maxWidth: .infinity)
        .navigationTitle(item.objectID)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsItemDetailView(item: HNItem.sample)
        }
        .environmentObject(NewsViewModel())
    }
}
