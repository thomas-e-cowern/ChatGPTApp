//
//  MacOSChatGPTApp.swift
//  MacOSChatGPT
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI

@main
struct MacOSChatGPTApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
                .environmentObject(AggregateModel())
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let contentView = ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(AggregateModel())
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(systemSymbolName: "brain", accessibilityDescription: "Brain")
            statusButton.action = #selector(togglePopover)
        }
        
        self.popover = NSPopover()
        self.popover.contentSize = NSSize(width: 800, height: 600)
        self.popover.behavior = .transient
        self.popover.contentViewController = NSHostingController(rootView: contentView)
    }
    
    @objc func togglePopover() {
        if let button = statusItem.button {
            if popover.isShown {
                self.popover.performClose(nil)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
    
}
