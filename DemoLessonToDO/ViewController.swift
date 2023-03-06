//
//  ViewController.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 06.03.23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM/dd"
        
        print(formatter.string(from: date))
    }


}

