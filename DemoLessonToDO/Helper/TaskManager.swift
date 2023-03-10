//
//  TaskManager.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 09.03.23.
//

import Foundation

class TaskManager {
    static let shared = TaskManager()
    
    private let tasksKey = "tasks"
    private var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    private func loadTasks() {
        let tasks = UserDefaultsHelper.shared.getObject(class: tasks.self, key: tasksKey)
        
        if let tasks = tasks {
            self.tasks = tasks
        }
    }
}
