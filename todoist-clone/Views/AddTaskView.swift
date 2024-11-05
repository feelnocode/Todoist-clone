//
//  AddTaskView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @FocusState var showKeyboard: Bool
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var priority = 1
    var body: some View {
        VStack(alignment: .leading){
            Group{
                UIKitTextInputView(text: $taskTitle, placeholder: "Task title")
                    .frame(height: 40)
                    .padding(.top, 10)
                TextField("Description", text: $taskDescription, axis: .vertical)
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
            }
            .padding(.leading, 10)
            .padding(.trailing, 15)
            .padding(.bottom, 10)
            .textFieldStyle(.plain)
            
            VStack{
                Text("Priority")
                    .foregroundStyle(.secondary)
                Picker("Priority", selection: $priority) {
                    ForEach(1...4 , id:\.self) {priority in
                        Text("\(priority)")
                    }
                }
            }
            .pickerStyle(.segmented)
            HStack(){
                Spacer()
                Button(action: {
                    modelContext.insert(TaskItem(title: taskTitle.trimmingCharacters(in: .whitespaces), taskDescription: taskDescription.trimmingCharacters(in: .whitespaces), priority: priority, isCompleted: false))
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.up")
                        .bold()
                })
                .frame(width: 40, height: 40)
                .background(.specificRed)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .padding(.trailing, 20)
                .padding(.bottom, 10)
            }
        }
        .background(ignoresSafeAreaEdges: .all)
        .background(.specificBackground)
        .onAppear(){
                showKeyboard = true
        }
    }
}

#Preview {
    AddTaskView()
}
