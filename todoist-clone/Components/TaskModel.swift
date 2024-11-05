//
//  TaskModel.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 04.11.2024.
//

import Foundation
import SwiftData


@Model
class TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var taskDescription: String
    var priority: Int
    var isCompleted: Bool
    var addedDate = Date.now
    
    init(id: UUID = UUID(), title: String, taskDescription: String, priority: Int, isCompleted: Bool, addedDate: Foundation.Date = Date.now) {
        self.id = id
        self.title = title
        self.taskDescription = taskDescription
        self.priority = priority
        self.isCompleted = isCompleted
        self.addedDate = addedDate
    }
}
