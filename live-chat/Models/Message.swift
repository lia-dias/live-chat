//
//  Message.swift
//  live-chat
//
//  Created by Lia Dias on 15/12/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String;
    var text: String;
    var received: Bool;
    var timestamp: Date;
}
