//
//  ChatModel.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 25.07.2022.
//

import Foundation

struct ChatModel: Identifiable{
    var id = UUID()
    var message: String
    var uidFirebase: String
    var receiver: String
    var sender: String
    var date: Date
    var isFromMe: Bool
}
