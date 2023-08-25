//
//  NSMenu+.swift
//  
//
//  Created by Ryan Linn on 5/8/23.
//

import AppKit

public extension NSMenu {
    
    /// Initializes a `NSMenu` with a non-empty array of `ContextMenuBuilder` instances.
    ///
    /// If the array is empty, the initializer will return nil.
    convenience init?(_ builderItems: [ContextMenuBuilder]) {
        guard !builderItems.isEmpty else { return nil }
        self.init()
        builderItems.forEach { self.addItem($0.menuItem) }
    }
}
