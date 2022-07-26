//
//  ChatStore.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 25.07.2022.
//

import Foundation
import Firebase
import Combine

class ChatStore: ObservableObject{
    
    let db = Firestore.firestore()
    var chatArray : [ChatModel] = []
    var objectWillChange = PassthroughSubject<Array<Any>,Never>()
    
    init(receiver: String){
        db.collection("Chats")
            .whereField("sender", isEqualTo: Auth.auth().currentUser!.uid)
            .whereField("receiver", isEqualTo: receiver)
            .addSnapshotListener { snapshot, error in
                if error != nil {
                    print(error?.localizedDescription)
                }else{
                    self.chatArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents{
                        let chatuid = document.documentID
                        if let chatMessage = document.get("message") as? String{
                            if let chatReceiver = document.get("receiver") as? String{
                                if let chatSender = document.get("sender") as? String{
                                    if let chatDateString = document.get("date") as? String{
                                         
                                        let formatter = DateFormatter()
                                        formatter.dateFormat = "yyyy_MM__dd_hh_mm__ss"
                                        let chatDate = formatter.date(from: chatDateString)
                                        
                                        let chat = ChatModel(message: chatMessage, uidFirebase: chatuid, receiver: chatReceiver, sender: chatSender, date: chatDate!, isFromMe: true)
                                        
                                        self.chatArray.append(chat)
                                    }
                                }
                            }
                        }
                    }
                }
                
                self.db.collection("Chats")
                    .whereField("sender", isEqualTo: receiver)
                    .whereField("receiver", isEqualTo: Auth.auth().currentUser!.uid)
                    .addSnapshotListener { snapshot, error in
                        if error != nil {
                            print(error?.localizedDescription)
                        }else{
                            for document in snapshot!.documents{
                                let chatuid = document.documentID
                                if let chatMessage = document.get("message") as? String{
                                    if let chatReceiver = document.get("receiver") as? String{
                                        if let chatSender = document.get("sender") as? String{
                                            if let chatDateString = document.get("date") as? String{
                                                 
                                                let formatter = DateFormatter()
                                                formatter.dateFormat = "yyyy_MM__dd_hh_mm__ss"
                                                let chatDate = formatter.date(from: chatDateString)
                                                
                                                let chat = ChatModel(message: chatMessage, uidFirebase: chatuid, receiver: chatReceiver, sender: chatSender, date: chatDate!, isFromMe: false)
                                                
                                                self.chatArray.append(chat)
                                            }
                                        }
                                    }
                                }
                            }
                            self.chatArray = self.chatArray.sorted(by: {
                                $0.date.compare($1.date) == .orderedAscending
                                
                            })
                            self.objectWillChange.send(self.chatArray)
                        }
                    }
            }
    }
    
}
