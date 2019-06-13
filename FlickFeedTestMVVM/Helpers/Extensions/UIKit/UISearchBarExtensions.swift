//
//  UISearchBarExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 11/07/18..
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
extension UINavigationBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 40.0)
    }
    
}
// MARK: - Properties
public extension UISearchBar {
	
	/// SwifterSwift: Text field inside search bar (if applicable).
	public var textField: UITextField? {
		let subViews = subviews.flatMap { $0.subviews }
		guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
			return nil
		}
		return textField
	}
	
	/// SwifterSwift: Text with no spaces or new lines in beginning and end (if applicable).
	public var trimmedText: String? {
		return text?.trimmed
	}
	
}


// MARK: - Methods
public extension UISearchBar {
	
	/// SwifterSwift: Clear text.
	public func clear() {
		text = ""
	}
}
#endif
