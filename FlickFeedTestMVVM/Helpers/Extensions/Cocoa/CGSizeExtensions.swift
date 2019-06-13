//
//  CGSizeExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 11/07/18..
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

#if os(macOS)
import Cocoa
#else
import UIKit
#endif


// MARK: - Methods
public extension CGSize {
	
	/// SwifterSwift: Aspect fit CGSize.
	///
	/// - Parameter boundingSize: bounding size to fit self to.
	/// - Returns: self fitted into given bounding size
	public func aspectFit(to boundingSize: CGSize) -> CGSize {
		let minRatio = min(boundingSize.width / width, boundingSize.height / height)
		return CGSize(width: width * minRatio, height: height * minRatio)
	}
	
	/// SwifterSwift: Aspect fill CGSize.
	///
	/// - Parameter boundingSize: bounding size to fill self to.
	/// - Returns: self filled into given bounding size
	public func aspectFill(to boundingSize: CGSize) -> CGSize {
		let minRatio = max(boundingSize.width / width, boundingSize.height / height)
		let w = min(width * minRatio, boundingSize.width)
		let h = min(height * minRatio, boundingSize.height)
		return CGSize(width: w, height: h)
	}
	
}
