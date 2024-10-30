//
//  HomeView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    AddButtonView()
                }
            }
            .background(.specificBackground)
            .navigationTitle("Today")
        }
    }
}

#Preview {
    HomeView()
}