//
//  MacOSChatGPTApp.swift
//  MacOSChatGPT
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI

@main
struct MacOSChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
