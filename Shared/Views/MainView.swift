//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    
    @EnvironmentObject private var model: AggregateModel
    
    @State private var chatText: String = ""
    
    let openIAKey = Bundle.main.infoDictionary?["CHAT_GPT_KEY"]
    
    private var isFormValid: Bool {
        chatText.isEmptOrWhiteSpaces
    }
    
    var body: some View {
        VStack {
            List(model.queries) { query in
                VStack(alignment: .leading) {
                    Text(query.question)
                        .fontWeight(.bold)
                    Text(query.answer)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.bottom], 10)
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
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
        .onChange(of: model.query) { query in
            model.queries.append(query)
        }
    }
    
    private func performSearch() {
        
        let openAI = OpenAISwift(authToken: openIAKey as! String)
        
        openAI.sendCompletion(with: chatText, maxTokens: 500) { result in
            switch result {
            case .success(let success):
                let answer = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                
                let query = QueryModel(question: chatText, answer: answer)
                DispatchQueue.main.async {
                    model.queries.append(query)
                }
                
                do {
                    try model.saveQuery(query)
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AggregateModel())
    }
}
