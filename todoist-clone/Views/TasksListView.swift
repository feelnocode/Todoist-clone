//
//  TasksListView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 04.11.2024.
//

import SwiftUI
import SwiftData

struct TasksListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \TaskItem.addedDate) private var taskItems: [TaskItem]
    private var testTasks = [TaskItem(title: "test", taskDescription: "test", priority: 3, isCompleted: false), TaskItem(title: "test2", taskDescription: "test2", priority: 1, isCompleted: false)]
    
    var body: some View {
        List {
            ForEach(taskItems) {task in
                if !task.isCompleted{
                    VStack{
                        HStack {
                            Button {
                                task.isCompleted.toggle()
                            } label: {
                                Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.secondary)
                                    
                            }
                            .padding(.trailing)
                            
                            
                            VStack(alignment: .leading){
                                Text(task.title)
                                    .font(.headline)
                                if !task.taskDescription.isEmpty{
                                    Text(task.taskDescription)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                    
                            }
                        }
                        
                    }
                    .listRowBackground(Color.specificBackground)
                    .listRowSeparator(.hidden)
                }
                
        }
            .onDelete { indexes in
                for index in indexes {
                    modelContext.delete(taskItems[index])
                }
            }
            .buttonStyle(.plain)
        }
        .background(.specificBackground)
        .scrollContentBackground(.hidden) //hiding original List background
        .background(ignoresSafeAreaEdges: .all)
        .listStyle(.plain)
        
    }
}

#Preview {
    TasksListView()
}
