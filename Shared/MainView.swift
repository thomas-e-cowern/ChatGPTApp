//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Thomas Cowern on 6/26/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var chatText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 10)
                
                Button {
                    // more to come
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45.0))
                }
                .padding(.trailing, 10)
            }
  

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
