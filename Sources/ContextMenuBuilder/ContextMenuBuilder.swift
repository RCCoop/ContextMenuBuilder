import AppKit
import Foundation

public protocol ContextMenuBuilder {
    var menuItem: NSMenuItem { get }
}

public struct SeparatorMenuBuilder: ContextMenuBuilder {
    public var menuItem: NSMenuItem {
        .separator()
    }
}

public struct SubMenuBuilder: ContextMenuBuilder {
    var title: String
    var image: NSImage? = nil
    var items: [ContextMenuBuilder]
    
    public var menuItem: NSMenuItem {
        let mainItem = NSMenuItem()
        mainItem.title = title
        mainItem.image = image
        let subMenu = NSMenu()
        items.forEach { subMenu.addItem($0.menuItem) }
        mainItem.submenu = subMenu
        return mainItem
    }
}

public struct ButtonMenuBuilder: ContextMenuBuilder {
    var title: String
    var image: NSImage?
    var action: (() -> Void)?
    
    public init(title: String, image: NSImage? = nil, action: (() -> Void)?) {
        self.title = title
        self.image = image
        self.action = action
    }
    
    @available(macOS 11.0, *)
    public init(title: String, systemImage: String, action: (() -> Void)?) {
        self.title = title
        self.image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil)
        self.action = action
    }
    
    public var menuItem: NSMenuItem {
        let actionedItem = NSMenuItemActioned(title: title, action: action)
        actionedItem.image = image
        return actionedItem
    }
}

internal final class NSMenuItemActioned: NSMenuItem {
    var actionHandler: (() -> Void)?
    
    init(title: String, action: (() -> Void)?) {
        self.actionHandler = action
        let cAction = action != nil ? #selector(performAction(_:)) : nil
        super.init(title: title, action: cAction, keyEquivalent: "")
        
        self.target = self
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func performAction(_ sender: Any?) {
        actionHandler?()
    }
}
