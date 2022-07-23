//
//  UserModel.swift
//  WhatsAppCloneSwiftUI
//
//  Created by Erge Gevher Akova on 23.07.2022.
//

import Foundation
import SwiftUI

struct UserModel : Identifiable {
    var id: UUID
    var email: String
    var uidFirebase: String
}


