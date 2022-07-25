//
//  UserDetailView.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

struct UserDetailView: View {
    let userId: String
    var body: some View {
        VStack {
            
        }
        .navigationTitle(userId)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(userId: "jl")
        }
    }
}
