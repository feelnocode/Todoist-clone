//
//  MainTabView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
                Tab("Home", systemImage: "house"){
                    HomeView()
                }
                Tab("Upcoming", systemImage: "calendar"){}
                Tab("Search", systemImage: "magnifyingglass"){}
                Tab("Browse", systemImage: "list.clipboard"){}
        }
        .tint(.specificRed)
        .onAppear {
            UITabBar.appearance().backgroundColor = .tabBar
        }
    }
}

#Preview {
    MainTabView()
}