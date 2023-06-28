//
//  QueryModel.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/28/23.
//

import Foundation

struct QueryModel: Identifiable, Hashable {
    
    let id = UUID()
    let question: String
    let answer: String
}
