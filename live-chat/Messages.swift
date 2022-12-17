//
//  Messages.swift
//  live-chat
//
//  Created by Lia Dias on 16/12/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = [];
    @Published private(set) var lastMessageId = "";
    
    let db = Firestore.firestore();
    
    init () {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap {
                document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message \(error)")
                    return nil
                }
            }
            
            self.messages = self.messages.filter { message in
                return !message.text.isEmpty
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: true, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage);
        } catch {
            print("Error adding message to Firestore\(error)")
        }
    }
}
