//
//  ChatRowView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 26.07.2022.
//

import SwiftUI

struct ChatRowView: View {
    var utl = Utils()
    var chat: ChatModel
    
    var body: some View {
        Group{
            if chat.isFromMe{
                HStack{
                    Spacer()
                    Text(chat.message)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(Color("color4"))
                        .cornerRadius(10)
                }
            }else{
                HStack{
                    Text(chat.message)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(Color("color4"))
                        .cornerRadius(10)
                    Spacer()
                }
                
            }
            
        }
        
    }
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView(chat: ChatModel(message: "aaa", uidFirebase: "123dasdq3e", receiver: "b", sender: "a", date: Date.now, isFromMe: true)).previewLayout(.sizeThatFits)
        ChatRowView(chat: ChatModel(message: "aaa", uidFirebase: "123dasdq3e", receiver: "b", sender: "a", date: Date.now, isFromMe: false)).previewLayout(.sizeThatFits)
    }
}
