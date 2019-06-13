//
//  UINavigationItemExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 11/07/18.
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


// MARK: - Methods
public extension UINavigationItem {
	
	/// SwifterSwift: Replace title label with an image in navigation item.
	///
	/// - Parameter image: UIImage to replace title with.
	public func replaceTitle(with image: UIImage) {
		let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
		logoImageView.contentMode = .scaleAspectFit
		logoImageView.image = image
		titleView = logoImageView
	}
	
}

extension UINavigationBar {
    func clear() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
        backgroundColor = .clear
    }
    
    
    /**
     * Method name: setNavigationBar
     * Description: Setting center image in the navigation bar
     */
//  @objc func setNavigationBarWithTintColor(color : UIColor,titleColor : UIColor){
//        
//        setBackgroundImage(nil, for: .default)
//        isTranslucent = false
//        barTintColor = color
//        tintColor = UIColor.black
//        let textAttributes = [NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font: mediumFontWithSize(18)!]
//        titleTextAttributes = textAttributes
//        // hides the shadow line below navigation bar
//        setValue(true, forKey: "hidesShadow")
//    }
    
    
    func setGradientBackground(colors: [UIColor]) {
        //88 max navigation bar height 
        var updatedFrame = bounds
        updatedFrame = CGRect(x: 0, y: 0, width: bounds.width, height: 88)
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        setBackgroundImage(gradientLayer.createGradientImage(), for: .default)
    }
}
#endif
