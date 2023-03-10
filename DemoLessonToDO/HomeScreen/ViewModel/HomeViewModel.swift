//
//  HomeViewModel.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 09.03.23.
//

import Foundation

class HomeViewModel {
    private let tasksKey = "tasks"
    var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        let tasks = UserDefaultsHelper.shared.getObject(class: tasks.self, key: tasksKey)
        
        if let tasks = tasks {
            self.tasks = tasks
        }
    }
    
    func addTask(title: String) {
        let task = Task(title: title)
        tasks.append(task)
        
        UserDefaultsHelper.shared.saveObject(self.tasks, key: tasksKey)
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
        
        UserDefaultsHelper.shared.saveObject(self.tasks, key: tasksKey)
    }
    
    func getTask(at index: Int) -> Task {
        let tasks = UserDefaultsHelper.shared.getObject(class: tasks.self, key: tasksKey)
        
        if let tasks = tasks {
            return tasks[index]
        }
        
        return Task(title: "Unknown")
    }
    
    func toggleTaskCompletion(at index: Int) {
        tasks[index].isCompleted.toggle()
        
        UserDefaultsHelper.shared.saveObject(self.tasks, key: tasksKey)

    }
}
