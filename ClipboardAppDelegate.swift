//
//  AppDelegate.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 16.06.24.
//

import Cocoa
import SwiftUI

class ClipboardAppDelegate: NSObject, NSApplicationDelegate {
    var clipboardWindowController: ClipboardWindowController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) {
            self.handleKeyDown(with: $0)
        }
    }

    private func handleKeyDown(with event: NSEvent) {
        let commandKey = NSEvent.ModifierFlags.command.rawValue
        let vKey = 0x09 // Virtual key code for 'V'

        if event.modifierFlags.rawValue & commandKey != 0 && event.keyCode == vKey {
            if let chars = event.charactersIgnoringModifiers, chars == "v" {
                if clipboardWindowController == nil || clipboardWindowController?.window?.isVisible == false {
                    openClipboardWindow()
                }
            }
        }
    }

    private func openClipboardWindow() {
        clipboardWindowController = ClipboardWindowController()
        clipboardWindowController?.showWindow(nil)
        NSApp.activate(ignoringOtherApps: true) // Bring the window to the front
    }
}
