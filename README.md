# ContextMenuBuilder

A package to make creating `NSMenu` context menus easier.

# `ContextMenuBuilder` protocol

The protocol requirement is just that conforming instances produce a `NSMenuItem` that will be added to the resulting `NSMenu`. You can make your own, but three default `ContextMenuBuilder` implementations are provided:

- `SubMenuBuilder` to add a submenu with a given list of other `ContextMenuBuilder`s.
- `SeparatorMenuBuilder` to add a separator item.
- `ButtonMenuBuilder` for a standard action menu item.

# `NSMenu` initializer

A convenience initializer for `NSMenu` takes an array of `ContextMenuBuilder` and populates the `NSMenu` with the builders' `NSMenuItem`s.

That's all!
