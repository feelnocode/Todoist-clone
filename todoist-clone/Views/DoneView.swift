//
//  DoneView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 04.11.2024.
//

import SwiftUI
import SwiftData

struct DoneView: View {
    @Environment(\.modelContext) var context
    @Query private var tasks: [TaskItem]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(tasks) {task in
                    if task.isCompleted{
                        HStack {
                            Button {
                                task.isCompleted.toggle()
                            } label: {
                                Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                            }
                            Text(task.title)
                        }
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        context.delete(tasks[index])
                    }
                }
                .listRowBackground(Color.specificBackground)
                .buttonStyle(.plain)
            }
            .background(.specificBackground)
            .scrollContentBackground(.hidden) //hiding original List background
            .background(ignoresSafeAreaEdges: .all)
            .listStyle(.plain)
            .navigationTitle("Done")
        }
    }
}

#Preview {
    DoneView()
}
