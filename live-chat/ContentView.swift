//
//  ContentView.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hello you", "How you've been doing?", "I've been building SwiftUI Application from scrath and it's so much fun!"]
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date())
                        )
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
