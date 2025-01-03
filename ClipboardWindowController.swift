//
//  ClipboardWindowController.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 16.06.24.
//

import Cocoa
import SwiftUI

class ClipboardWindowController: NSWindowController {
    convenience init() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 400),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false)
        let view = ClipboardWindowView()
        window.contentView = NSHostingView(rootView: view)
        self.init(window: window)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.title = "Clipboard History"
        window?.center()
    }
}



