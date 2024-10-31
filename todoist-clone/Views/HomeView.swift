//
//  HomeView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button("+"){
                        showingSheet.toggle()
                    }
                        .buttonStyle(PlusButton())
                        .sheet(isPresented: $showingSheet){
                            AddTaskView()
                                .presentationDetents([.height(180)])
                        }
                        
                }
            }
            .background(.specificBackground)
            .navigationTitle("Today")
            .toolbar(){
                Button("", systemImage: "ellipsis"){}
            }
        }
    }
}

#Preview {
    HomeView()
}
