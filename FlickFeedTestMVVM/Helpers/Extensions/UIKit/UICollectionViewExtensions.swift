//
//  UICollectionViewExtensions.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 11/07/18.
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


// MARK: - Properties
public extension UICollectionView {
	
	/// SwifterSwift: Index path of last item in collectionView.
	public var indexPathForLastItem: IndexPath? {
		return indexPathForLastItem(inSection: lastSection)
	}
	
	/// SwifterSwift: Index of last section in collectionView.
	public var lastSection: Int {
		return numberOfSections > 0 ? numberOfSections - 1 : 0
	}
	
	/// SwifterSwift: Number of all items in all sections of collectionView.
	public var numberOfItems: Int {
		var section = 0
		var itemsCount = 0
		while section < self.numberOfSections {
			itemsCount += numberOfItems(inSection: section)
			section += 1
		}
		return itemsCount
	}
	
}


// MARK: - Methods
public extension UICollectionView {
    
	/// SwifterSwift: IndexPath for last item in section.
	///
	/// - Parameter section: section to get last item in.
	/// - Returns: optional last indexPath for last item in section (if applicable).
	public func indexPathForLastItem(inSection section: Int) -> IndexPath? {
		guard section >= 0 else {
			return nil
		}
		guard section < numberOfSections else {
			return nil
		}
		guard numberOfItems(inSection: section) > 0 else {
			return IndexPath(item: 0, section: section)
		}
		return IndexPath(item: numberOfItems(inSection: section) - 1, section: section)
	}
	
	/// SwifterSwift: Reload data with a completion handler.
	///
	/// - Parameter completion: completion handler to run after reloadData finishes.
	public func reloadData(_ completion: @escaping () -> Void) {
		UIView.animate(withDuration: 0, animations: {
			self.reloadData()
		}, completion: { _ in
			completion()
		})
	}
	
	/// SwifterSwift: Dequeue reusable UICollectionViewCell using class name.
	///
	/// - Parameters:
	///   - name: UICollectionViewCell type.
	///   - indexPath: location of cell in collectionView.
	/// - Returns: UICollectionViewCell object with associated class name.
	public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as! T
    }

	/// SwifterSwift: Dequeue reusable UICollectionReusableView using class name.
	///
	/// - Parameters:
	///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
	///   - name: UICollectionReusableView type.
	///   - indexPath: location of cell in collectionView.
	/// - Returns: UICollectionReusableView object with associated class name.
	public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as! T
    }

	/// SwifterSwift: Register UICollectionReusableView using class name.
	///
	/// - Parameters:
	///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
	///   - name: UICollectionReusableView type.
	public func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
	
	/// SwifterSwift: Register UICollectionViewCell using class name.
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the collectionView cell.
    ///   - name: UICollectionViewCell type.
    public func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UICollectionViewCell using class name.
    ///
    /// - Parameter name: UICollectionViewCell type.
    public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }

	/// SwifterSwift: Register UICollectionReusableView using class name.
	///
	/// - Parameters:
	///   - nib: Nib file used to create the reusable view.
	///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
	///   - name: UICollectionReusableView type.
	public func register<T: UICollectionReusableView>(nib: UINib?, forSupplementaryViewOfKind kind: String, withClass name: T.Type) {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }

}
#endif
