//
//  HistoryView.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/28/23.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject private var model: AggregateModel
    @Environment(\.dismiss) private var dismiss
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) private var historyItemResults: FetchedResults<HistoryItem>
    
    var body: some View {
        List(historyItemResults) { historyItem in
            Text(historyItem.question ?? "No question")
                .frame(maxWidth: .infinity, alignment: .leading)
                .containerShape(Rectangle())
                .onTapGesture {
                    model.query = QueryModel(question: historyItem.question ?? "", answer: historyItem.answer ?? "No answer")
                    #if os(iOS)
                        dismiss()
                    #endif
                }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(AggregateModel())
    }
}
