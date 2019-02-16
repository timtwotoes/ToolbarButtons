//
//  WindowToolbarController.swift
//  ToolbarButtons
//
//  Created by Tim Wolff on 16/02/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

/**
 Custom window controller that grants, the windows view controller, access to the toolbar
 associated with the window.
 */
class WindowToolbarController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Only ask the if a tool bar and a view controller is allocated.
        if let toolbar = window?.toolbar, let controller = contentViewController {
            controller.inspect(toolbar: toolbar)
        }
    }

}

// Grants an object access to the toolbar.
@objc protocol ToolbarInspector {
    /**
     Examine toolbar
     
     - parameter toolbar: The toolbar associated with the window.
     - precondition: Window must have a toolbar associated.
     */
    func inspect(toolbar: NSToolbar)
}

// Add the ToolbarInspector to all view controllers
extension NSViewController: ToolbarInspector {
    func inspect(toolbar: NSToolbar) {}
}
