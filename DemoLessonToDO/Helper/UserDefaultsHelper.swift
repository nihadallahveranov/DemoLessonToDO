//
//  UserDefaultsHelper.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 06.03.23.
//

import Foundation

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    func saveObject<T: Codable>(_ object: T?, key: String) {
        if let object = object {
            if let data = try? JSONEncoder().encode(object) {
                UserDefaults.standard.set(data, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func getObject<T: Codable>(class: T?, key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key),
           let object = try? JSONDecoder().decode(T.self, from: data) {
            return object
        } else {
            return nil
        }
    }
}
