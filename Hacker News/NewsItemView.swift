//
//  NewsItemView.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

struct NewsItemView: View {
    let newsItem: HNItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(newsItem.title ?? "N/A")
                    .font(.headline)
                    .lineLimit(2)
            }
            if let url = newsItem.url ?? newsItem.storyURL {
                Link(url, destination: URL(string: url)!)
                    .font(.caption2)
                    .lineLimit(1)
            }
            HStack(spacing: 4) {
                Text(String(newsItem.points ?? 0) + " points")
                Text("·")
                Text(newsItem.createdAt?.relativeString() ?? "N/A")
                Text("·")
                Text(String(newsItem.numComments ?? 0) + " comments")
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsItemView(newsItem: HNItem.sample)
            NewsItemView(newsItem: HNItem.sample)
                .preferredColorScheme(.dark)
        }
    }
}
