//
//  iOSChatGPTApp.swift
//  iOSChatGPT
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI

@main
struct iOSChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}
