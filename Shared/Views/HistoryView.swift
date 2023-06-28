//
//  HistoryView.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/28/23.
//

import SwiftUI

struct HistoryView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        Text("History View")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(AggregateModel())
    }
}
