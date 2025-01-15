//
//  UserModel.swift
//  CafeManager
//
//  Created by Alexandr on 13/01/2025.
//  Copyright © 2025 Alexandr. All rights reserved.
//

import Foundation

struct UserModel {
    var email: String = ""
    var password: String = ""
    var fio: String = ""
    var guest: Int = 0
    var table: Int = 0
    
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    func isValidPassword() -> Bool {
        return !password.isEmpty
    }
    
    func isValidFIO() -> Bool {
        let fioFormat = "^[А-ЯЁ][а-яё]+\\s[А-ЯЁ][а-яё]+\\s[А-ЯЁ][а-яё]+$"
        let fioPredicate = NSPredicate(format: "SELF MATCHES %@", fioFormat)
        return fioPredicate.evaluate(with: fio)
    }
    
    func isValidGuest() -> Bool {
        if guest >= 1 && guest <= 8 {
            return true
        } else {
            return false
        }
    }
    
    func isValidTable() -> Bool {
        if table >= 1 && table <= 32 {
            return true
        } else {
            return false
        }
    }
}
