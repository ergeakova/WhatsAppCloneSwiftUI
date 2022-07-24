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
            Text("Sign In")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
            TextField("Email", text: $userEmail)
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .background(.white)
                .cornerRadius(15)
                .autocapitalization(.none)
            
            SecureField("Password", text: $userPassword)
                .font(.title2)
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .background(.white)
                .cornerRadius(15)
                .autocapitalization(.none)
            HStack{
                //TO DO 
                Spacer()
                NavigationLink(destination: SignUpView(newUserEmail: "", newUserFirstPassword: "", newUserSecondPassword: "")) {
                    Text("Forgot your password??")
                        .foregroundColor(Color("color4"))
                        .shadow(color: .white, radius: 0.5, x: 0.5, y: 0.5)
                        .padding(.vertical, 5)
                }
            }
            
            
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
                    .background(Color("color2"))
                    .cornerRadius(15)
            }
            
            
            NavigationLink(destination: SignUpView(newUserEmail: "", newUserFirstPassword: "", newUserSecondPassword: "")) {
                Text("Sign UP")
                    .foregroundColor(Color("color1"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .frame(width: utl.scWidth * 0.5)
                    .background(Color("color2"))
                    .cornerRadius(15)
            }
            
            NavigationLink(" ", isActive: $isAuthenticate) {
                        UserView()
            }
            
        }.navigationBarHidden(true)
            .frame(width: utl.scWidth * 0.9)
            .background(Color("color1"))
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
