//
//  LocalExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by Basem Emara on 4/19/17.
//  Copyright © 2018 Diasporatec LTD.. All rights reserved.
//

import Foundation


// MARK: - Properties
public extension Locale {

    /// SwifterSwift: UNIX representation of locale usually used for normalizing.
    public static var posix: Locale {
        return Locale(identifier: "en_US_POSIX")
    }
	
}
