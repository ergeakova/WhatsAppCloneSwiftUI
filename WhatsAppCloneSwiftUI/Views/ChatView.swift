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
            
            ScrollView{
                
                ForEach(chatStore.chatArray){ chat in
                ChatRowView(chat: chat)
                        .padding(2)
                }
                
            }.padding(.horizontal)
            
            HStack{
              
                TextField("", text: $sendMsg)
                    .padding(.vertical,7)
                    .font(.title3)
                    .background(Color("color2"))
                    .cornerRadius(3)
                    .frame(height: utl.scHeigth * 0.08)
              
                        Button {
                            if(utl.isEmptyString(value: sendMsg)){
                                let sendMessageStatus = chatService.sendMessage(receiver: userToChat, message: sendMsg)
                                if(utl.isEmptyString(value: sendMessageStatus )){
                                    sendMsg = ""
                                }else{
                                    errorMsg = sendMessageStatus
                                    showError = true
                                }
                            }
                        } label: {
                            Image("sendIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: .infinity)
                                
                        }.padding(.vertical)
                    .padding(.trailing, 6)
                    
            }.frame(height: utl.scHeigth * 0.08)
                    
            
        }.onAppear(){
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("color3"))]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("color3"))]
            UINavigationBar.appearance().barTintColor = UIColor(Color("color1"))
        } .navigationTitle(userToChat.email.split(separator: "@")[0])
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
