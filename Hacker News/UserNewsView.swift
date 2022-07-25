//
//  UserNewsView.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

struct UserNewsView: View {
    let user: String
    var body: some View {
        Text("Hello, World!")
    }
}

struct UserNewsView_Previews: PreviewProvider {
    static var previews: some View {
        UserNewsView(user: HNItem.sample.author)
    }
}
