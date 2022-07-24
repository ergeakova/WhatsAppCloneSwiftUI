//
//  UserStore.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 23.07.2022.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class UserStore: ObservableObject {
    
    let db = Firestore.firestore()
    var userArray: [UserModel] = []
    var objectWillChange = PassthroughSubject<Array<Any>,Never>()
    
    init(){
        
        db.collection("Users").addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                self.userArray.removeAll(keepingCapacity: false)
                for document in snapshot!.documents {
                    if let userUidFirebase = document.get("userUid") as? String {
                        
                        if let userMail = document.get("email") as? String{
                            let user = UserModel(email: userMail, uidFirebase: userUidFirebase)
                            
                            self.userArray.append(user)
                        }
                    }
                }
                self.objectWillChange.send(self.userArray)
            }
        }
        
    }
    
    
}
