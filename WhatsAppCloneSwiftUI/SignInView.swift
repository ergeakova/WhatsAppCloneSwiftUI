//
//  SingInView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import SwiftUI
import Firebase

struct SignInView: View {
    var utl = Utils()
    @State var userEmail: String
    @State var userPassword: String
    @State var isAuthenticate = false
    
    @State private var showError = false
    @State var errorMsg = ""
    
    var body: some View {
        VStack{
            TextField("Email", text: $userEmail)
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .background(.white)
                .cornerRadius(15)
            
            TextField("Password", text: $userPassword)
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .background(.white)
                .cornerRadius(15)
            
            Button {
                
                Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
                    if error != nil{
                        errorMsg = error?.localizedDescription ?? "Error!!!"
                        showError = true
                    }else{
                        isAuthenticate = true
                    }
                }
                
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .frame(width: utl.scWidth * 0.5)
                    .background(Color("Color2"))
                    .cornerRadius(15)
                
                NavigationLink(" ", isActive: $isAuthenticate) {
                    UserView()
                }
            }
            
            
            NavigationLink(destination: SignUpView(newUserEmail: "", newUserFirstPassword: "", newUserSecondPassword: "")) {
                Text("Sign UP")
                    .foregroundColor(Color("Color1"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .frame(width: utl.scWidth * 0.5)
                    .background(Color("Color6"))
                    .cornerRadius(15)
            }

        }.frame(width: utl.scWidth * 0.9)
            .background(Color("Color1"))
            .alert(isPresented: $showError) {
                        return  Alert(
                            title: Text("Error!!!"),
                            message: Text(errorMsg))
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(userEmail: "email", userPassword: "Password")
    }
}
