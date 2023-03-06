//
//  OnBoardingViewModel.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 07.03.23.
//

import Foundation

class OnBoardingViewModel {
    var list: [OnBoardingModel] = []
    
    func getItems() {
        let items: [OnBoardingModel] = [
            OnBoardingModel(title: "Welcome", subTitle: "My ToDO App", image: "todo-1"),
            OnBoardingModel(title: "Welcome", subTitle: "My ToDO App", image: "todo-2"),
            OnBoardingModel(title: "Welcome", subTitle: "My ToDO App", image: "todo-3")
        ]
        
        self.list = items
    }
}
