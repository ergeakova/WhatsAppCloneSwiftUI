//
//  ContentView.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import SwiftUI

struct AuthView: View {
    var utl = Utils()
    var body: some View {
        NavigationView{
            VStack{
                SignInView(userEmail:"", userPassword: "")
            }.frame(width: utl.scWidth, height: utl.scHeigth)
                .background(Color("color1"))
                .navigationTitle("Sing In").navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().background(Color("color1"))
    }
}
