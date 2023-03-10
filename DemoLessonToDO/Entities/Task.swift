//
//  Task.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 09.03.23.
//

import Foundation

struct Task: Codable {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
