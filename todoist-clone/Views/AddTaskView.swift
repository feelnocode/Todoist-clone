//
//  AddTaskView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState var showKeyboard: Bool
    @State private var taskTitle = ""
    @State private var taskDescription = ""
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
            ScrollView(.horizontal) {
                HStack{
                    Button("first"){}
                    Button("second"){}
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.secondary)
                
               
            }
            Divider()
            HStack(){
                Spacer()
                Button(action: {
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
