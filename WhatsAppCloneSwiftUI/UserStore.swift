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
        
    }
    
    
}
