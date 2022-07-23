//
//  SingUpView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    let db = Firestore.firestore()
    var utl = Utils()
    var userService = AuthService()
    @State private var showError = false
    @State var errorMsg = ""
    @State var isCreatedUser = false
    
    @State var newUserEmail: String
    @State var newUserFirstPassword: String
    @State var newUserSecondPassword: String
    
    var body: some View {
        VStack{
            VStack{
                Text("Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                TextField("Email", text: $newUserEmail)
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .background(.white)
                    .cornerRadius(15)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $newUserFirstPassword)
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .background(.white)
                    .cornerRadius(15)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $newUserSecondPassword)
                    .font(.title2)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                    .background(.white)
                    .cornerRadius(15)
                    .autocapitalization(.none)
                
                Button {
                    if(userService.createNewUser(userEmail: newUserEmail, firstPassword: newUserFirstPassword, secondPassword: newUserSecondPassword)){
                        Auth.auth().createUser(withEmail: newUserEmail, password: newUserFirstPassword) { result, error in
                            if error != nil{
                                errorMsg = error?.localizedDescription ?? "Error!!!"
                                showError = true
                            }else{
                                if result != nil{
                                    
                                    let myUserDic: [String : Any] = ["email": result?.user.email, "userUid": result?.user.uid ]
                                    
                                    _ = db.collection("Users").addDocument(data: myUserDic, completion: { error in
                                        if error != nil{
                                            errorMsg = error?.localizedDescription ?? "Error!!!"
                                            showError = true
                                        }
                                    })
                                }
                                isCreatedUser = true
                            }
                        }
                        
                    }else{
                        errorMsg = "Check Email and Passwords!!!"
                        showError = true
                    }
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.vertical, 5.0)
                        .frame(width: utl.scWidth * 0.5)
                        .background(Color("color3"))
                        .cornerRadius(15)
                    
                        NavigationLink(" ", isActive: $isCreatedUser) {
                            UserView()
                        }
                }
            }.frame(width: utl.scWidth * 0.9)
        }.frame(width: utl.scWidth, height: utl.scHeigth)
            .background(Color("color1"))
            .alert(isPresented: $showError) {
                        return  Alert(
                            title: Text("Error!!!"),
                            message: Text(errorMsg))
            }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(newUserEmail: "email", newUserFirstPassword: "Password", newUserSecondPassword: "Password")
    }
}
