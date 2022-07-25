//
//  Hacker_NewsApp.swift
//  Hacker News
//
//  Created by Ravi Goswami on 24/07/22.
//

import SwiftUI

@main
struct Hacker_NewsApp: App {
    @StateObject var viewModel = NewsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
