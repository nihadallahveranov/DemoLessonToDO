//
//  OnBoardingCollectionViewCell.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 07.03.23.
//

import UIKit
import Lottie

enum LottieAnimations {
    static let TODO_1 = "todo-1"
    static let TODO_2 = "todo-2"
    static let TODO_3 = "todo-3"
}

class OnBoardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    func configure(item: OnBoardingModel) {
        for subUIView in self.view.subviews {
            subUIView.removeFromSuperview()
        }
        
        self.titleLbl.text = item.title
        self.subTitleLbl.text = item.subTitle
        
        var animationView: LottieAnimationView?
        animationView = .init(name: item.image)
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        
        if item.image == LottieAnimations.TODO_3 {
            animationView!.loopMode = .playOnce
        } else {
            animationView!.loopMode = .loop
        }
        
        animationView!.animationSpeed = 0.5
        self.view.addSubview(animationView!)
        animationView!.play()
    }
}
