//
//  String+Extensions.swift
//  iOSChatGPT
//
//  Created by Thomas Cowern on 6/27/23.
//

import Foundation

extension String {
    
    var isEmptOrWhiteSpaces: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
