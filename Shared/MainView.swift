//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    
    @State private var chatText: String = ""
    @State private var answers: [String] = []
    
    let openIAKey = Bundle.main.infoDictionary?["CHAT_GPT_KEY"]
    
    private var isFormValid: Bool {
        chatText.isEmptOrWhiteSpaces
    }
    
    var body: some View {
        VStack {
            List(answers, id: \.self) { answer in
                Text(answer)
            }
            Spacer()
            HStack {
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 10)
                
                Button {
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45.0))
                }
                .padding(.trailing, 10)
                .disabled(isFormValid)
            }
  

        }
    }
    
    private func performSearch() {
        
        let openAI = OpenAISwift(authToken: openIAKey as! String)
        
        openAI.sendCompletion(with: chatText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
                print(success)
                let answer = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                answers.append(answer)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
