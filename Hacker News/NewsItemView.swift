//
//  NewsItemView.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

struct NewsItemView: View {
    let newsItem: NewsItem
    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Image(systemName: "arrowtriangle.up.fill")
                Text(String(newsItem.score))
            }
            .frame(width: 36)
            VStack(alignment: .leading) {
                Text(newsItem.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack {
                    Spacer()
                    Text(newsItem.by)
                        .font(.caption)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(newsItem: NewsItem.sample)
    }
}
