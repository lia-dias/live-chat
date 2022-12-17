//
//  ContentView.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                TitleRow()
                if messagesManager.messages.isEmpty {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                }
                else {
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(messagesManager.messages, id: \.id) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .onChange(of: messagesManager.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom )
                            }
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
                .background(.white)
        }
        .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
