//
//  MessageBubble.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message;
    
    @State private var showTime = false;
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle();
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageBubble(message: Message(id: "1", text: "This is a message", received: false, timestamp: Date()))
            MessageBubble(message: Message(id: "1", text: "This is a message", received: true, timestamp: Date()))
        }
    }
}
