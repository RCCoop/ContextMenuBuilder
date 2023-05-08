//
//  NSMenu+.swift
//  
//
//  Created by Ryan Linn on 5/8/23.
//

import AppKit

public extension NSMenu {
    convenience init(_ builderItems: [ContextMenuBuilder]) {
        self.init()
        builderItems.forEach { self.addItem($0.menuItem) }
    }
}
