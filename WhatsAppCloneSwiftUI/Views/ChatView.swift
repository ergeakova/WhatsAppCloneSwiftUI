//
//  ChatView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 24.07.2022.
//

import SwiftUI

struct ChatView: View {
    var utl = Utils()
    var chatService = ChatService()
    var userToChat : UserModel
    @State var sendMsg = ""
    @State private var showError = false
    @State var errorMsg = ""
    @EnvironmentObject var chatStore : ChatStore

    var body: some View {
        VStack{
            
            Text(userToChat.email)
            
            List(chatStore.chatArray){ chat in
                Text(chat.message)
            }
            
            HStack{
                TextField("", text: $sendMsg)
                    .font(.title3)
                    .background(Color("color2"))
                    .cornerRadius(3)
                    .padding(.leading)
                    
                Text(" > ")
                    .font(.title)
                    .background(Color("color4"))
                    .cornerRadius(15)
                    .padding(.trailing)
                    .onTapGesture {
                        let sendMessageStatus = chatService.sendMessage(receiver: userToChat, message: sendMsg)
                        if(utl.isEmptyString(value: sendMessageStatus )){
                            sendMsg = ""
                        }else{
                            errorMsg = sendMessageStatus
                            showError = true
                        }
                    }
                    
            }
        }
            .background(Color("color1"))
            .alert(isPresented: $showError) {
                        return  Alert(
                            title: Text("Error!!!"),
                            message: Text(errorMsg))
            }
            
    }

        
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userToChat: UserModel(email: "deneme", uidFirebase: "deneme"), sendMsg: "")
    }
}
