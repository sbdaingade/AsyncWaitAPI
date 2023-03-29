//
//  AsyncAwaitDemoApp.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import SwiftUI

@main
struct AsyncAwaitDemoApp: App {
    @StateObject var homeViewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(viewModel: homeViewModel)
            }
        }
    }
}
