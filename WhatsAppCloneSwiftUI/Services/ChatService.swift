//
//  ChatService.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 25.07.2022.
//

import Foundation
import Firebase

struct ChatService {
    var utl = Utils()
    let db = Firestore.firestore()
    
    func sendMessage(receiver: UserModel, message: String) -> String{
        var sendState = "error"
        var ref: DocumentReference? = nil
        
        let myChatDic : [String: Any] = ["sender" : Auth.auth().currentUser!.uid, "receiver": receiver.uidFirebase, "date": utl.generateDate(), "message" :  message]
        ref = self.db.collection("Chats").addDocument(data: myChatDic, completion: { error in
            if error != nil {
                sendState = error?.localizedDescription.description ?? "Error"
            } else {
                sendState = ""
            }
        })
        return sendState
    }
}
