//
//  ContentView.swift
//  MacOSChatGPT
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationSplitView {
            HistoryView()
        } detail: {
            MainView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

