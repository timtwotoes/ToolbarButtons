//
//  ViewController.swift
//  ToolbarButtons
//
//  Created by Tim Wolff on 16/02/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

fileprivate let addToolbarItemIdentifier = NSToolbarItem.Identifier("AddToolbarItem")
fileprivate let removeToolbarItemIdentifier = NSToolbarItem.Identifier(rawValue: "RemoveToolbarItem")

class ViewController: NSViewController {
    weak var addToolbarItem: NSToolbarItem?
    weak var removeToolbarItem: NSToolbarItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func didPressRemoveButton(_ sender: NSToolbarItem) {
        print("Did press Remove button.")
    }
    
    @IBAction func didPressAddButton(_ sender: NSToolbarItem) {
        print("Did press Add button.")
    }
    
    override func inspect(toolbar: NSToolbar) {
        var toolbarItems = [NSToolbarItem.Identifier : NSToolbarItem]()
        for item in toolbar.items {
            toolbarItems[item.itemIdentifier] = item
        }
        
        addToolbarItem = toolbarItems[addToolbarItemIdentifier]
        removeToolbarItem = toolbarItems[removeToolbarItemIdentifier]
        
        // Disable the remove button.
        if let removeButton = removeToolbarItem {
            removeButton.isEnabled = false
        }
    }
}

