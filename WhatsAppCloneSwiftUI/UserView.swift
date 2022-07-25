//
//  UserView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import SwiftUI
import Firebase

struct UserView: View {
    var utl = Utils()
    @ObservedObject var userStore = UserStore()
    @State var isSignOut = false
    
    var body: some View {
            
        VStack{
            NavigationLink(isActive: $isSignOut , destination: {
                            AuthView()
            }, label: {
                
                Text("Sign Out").foregroundColor(Color("color4"))
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                    .padding(.trailing)
               
            })
            
            List(userStore.userArray){ user in
                
                NavigationLink(destination: ChatView(userToChat: user, sendMsg: "")){
                    Text(user.email)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }.listRowBackground(Color("color4"))
                
            }.onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
                
        }.navigationBarHidden(true)
            .background(Color("color1"))
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
