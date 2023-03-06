//
//  UIView+Extension.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 06.03.23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
