//
//  WhatsAppCloneSwiftUIApp.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 22.07.2022.
//

import SwiftUI
import FirebaseCore

@main
struct WhatsAppCloneSwiftUIApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
