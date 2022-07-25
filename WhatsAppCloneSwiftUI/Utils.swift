//
//  Utils.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import Foundation
import SwiftUI

struct Utils{
    let scWidth = UIScreen.main.bounds.width
    let scHeigth = UIScreen.main.bounds.height
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_MM__dd_hh_mm__ss"
        
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    func isEmptyString(value: String) -> Bool{
         if value != "" {
             return true
         }else{
             return false
         }
     }
}
