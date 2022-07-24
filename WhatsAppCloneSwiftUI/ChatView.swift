//
//  ChatView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 24.07.2022.
//

import SwiftUI

struct ChatView: View {
    var utl = Utils()
    var userToChat : UserModel
    var body: some View {
        VStack{
            Text(userToChat.email)
        }.frame(width: utl.scWidth, height: utl.scHeigth)
        .background(Color("color1"))
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(email: "deneme", uidFirebase: "deneme"))
    }
}
