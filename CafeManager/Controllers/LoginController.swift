//
//  LoginController.swift
//  CafeManager
//
//  Created by Alexandr on 13/01/2025.
//  Copyright © 2025 Alexandr. All rights reserved.
//

import Foundation

class LoginController {
    private var user = UserModel()
    
    func updateEmail(_ email: String) {
        user.email = email
    }
    
    func updatePassword(_ password: String) {
        user.password = password
    }
    
    func updateFio(_ fio: String) {
        user.fio = fio
    }
    
    func updateGuest(_ guest: Int) {
        user.guest = guest
    }
    
    func updateTable(_ table: Int) {
        user.table = table
    }
    
    func canLogin() -> Bool {
        return user.isValidEmail() && user.isValidPassword()
    }
    
    func canBill() -> Bool {
        return user.isValidFIO() && user.isValidGuest() && user.isValidTable()
    }
}
