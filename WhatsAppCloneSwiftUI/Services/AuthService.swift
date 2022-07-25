//
//  AuthService.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import Foundation


import Foundation
import Firebase

struct AuthService{
    func createNewUser(userEmail: String, firstPassword: String, secondPassword: String) -> Bool{
        if(isValidEmail(email: userEmail) && isValidPasswords(firstPassword: firstPassword, secondPassword: secondPassword) ){
            return true
        }else{
            return false
        }
        
    }
    
    func isValidEmail(email: String)-> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPasswords(firstPassword: String, secondPassword: String) -> Bool{
        if (firstPassword == secondPassword && firstPassword.count >= 8){
            return true
        }else{
            return false
        }
    }
    
}

