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
    @State var newMsg: String
    var body: some View {
        VStack{
            Text(userToChat.email)
            Spacer()
            HStack{
                TextField("",text: $newMsg)
                    .font(.title3)
                    .background(Color("color2"))
                    .cornerRadius(3)
                    .padding(.leading)
                    
                Text(" > ")
                    .font(.title)
                    .background(Color("color4"))
                    .cornerRadius(15)
                    .padding(.trailing)
                    .onAppear(){
                        sendMessage()
                    }
                    
            }
        }.navigationBarHidden(true)
            .background(Color("color1"))
            
    }

    func sendMessage(){
        
    }
        
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(email: "deneme", uidFirebase: "deneme"), newMsg: "")
    }
}
