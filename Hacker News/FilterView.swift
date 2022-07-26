//
//  FilterView.swift
//  Hacker News
//
//  Created by Ravi on 26/07/22.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var viewModel: NewsViewModel
    @Environment(\.dismiss) var dismiss
    
//    @AppStorage("tapCount") private var tapCount = 0
    @AppStorage("displayOption") private var selectedDisplayOption = "Date"
    @State private var newsDisplayOptions = ["Date", "Popularity"]
    
    @AppStorage("tag") private var selectedTag = "story"
    @State private var tags = ["story", "comment", "poll", "pollopt", "show_hn", "ask_hn", "front_page"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Show News by", selection: $selectedDisplayOption) {
                        ForEach(newsDisplayOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Picker("Tag", selection: $selectedTag) {
                        ForEach(tags, id: \.self) {
                            Text($0.capitalized)
                        }
                    }
                }
                
                Section {
                    Button {
                        viewModel.resetItems()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
