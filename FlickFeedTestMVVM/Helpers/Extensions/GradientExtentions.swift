//
//  GradientExtentions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 28/09/18.
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        locations = [0, 1]
        startPoint = CGPoint(x: 0.25, y: 0.5)
        endPoint = CGPoint(x: 0.75, y: 0.5)
        transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0.29, c: -0.29, d: 1, tx: 0.15, ty: -0.1))
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(self.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}
