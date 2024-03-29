//
//  OptionalExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 11/07/18.
//  Copyright © 2018 Diasporatec LTD.. All rights reserved.
//

import Foundation


public extension Optional {
	
	/// SwifterSwift: Get self of default value (if self is nil).
	///
	/// - Parameter defaultValue: default value to return if self is nil.
	/// - Returns: self if not nil or default value if nil.
	public func unwrapped(or defaultValue: Wrapped) -> Wrapped {
		// http://www.russbishop.net/improving-optionals
		return self ?? defaultValue
	}
    
//    public func unwrappedString() -> Wrapped {
//        // http://www.russbishop.net/improving-optionals
//        return self as! String ?? "" as! Wrapped
//    }
	
	/// SwifterSwift: Runs a block to Wrapped if not nil
	///
	/// - Parameter block: a block to run if self is not nil.
	public func run(_ block: (Wrapped) -> Void) {
		// http://www.russbishop.net/improving-optionals
		_ = self.map(block)
	}
}
