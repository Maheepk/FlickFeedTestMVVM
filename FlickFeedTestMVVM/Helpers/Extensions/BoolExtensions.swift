//
//  BoolExtensions.swift
//  SSTests
//
//  Created by vishnu khaitan on 11/07/18.
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

import Foundation


// MARK: - Properties
public extension Bool {
	
	/// SwifterSwift: Return 1 if true, or 0 if false.
	public var int: Int {
		return self ? 1 : 0
	}
	
	/// SwifterSwift: Return "true" if true, or "false" if false.
	public var string: String {
		return description
	}
	
	/// SwifterSwift: Return inversed value of bool.
	public var toggled: Bool {
		return !self
	}
	
}

// MARK: - Methods
public extension Bool {
	
	/// SwifterSwift: Toggle value for bool.
	///
	/// - Returns: inversed value of bool.
	@discardableResult public mutating func toggle() -> Bool {
		self = !self
		return self
	}
	
}
