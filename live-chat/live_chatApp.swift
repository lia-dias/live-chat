//
//  live_chatApp.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import SwiftUI
import Firebase

@main
struct live_chatApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
