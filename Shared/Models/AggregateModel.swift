//
//  AggregateModel.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/28/23.
//

import Foundation

class AggregateModel: ObservableObject {
    
    @Published var queries: [QueryModel] = []
    
    func saveQuery(_ query: QueryModel) throws {
        
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.question = query.question
        historyItem.answer = query.answer
        historyItem.dateCreated = Date()
        try viewContext.save()
    }
}
