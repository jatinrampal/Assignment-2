//
//  User.swift
//  Assignment-1
//
//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 Jatin Rampal. All rights reserved.
//

class User {
    
    var name: String?
    var address: String?
    var city: String?
    var email: String?
    var phone: String?
    var avatar: Int?
    
    init(name: String?, address:String?, city: String?, email: String?, phone:String?, avatar: Int?) {
        self.name = name
        self.address = address
        self.city = city
        self.phone = phone
        self.email = email
        self.avatar = avatar
    }
}
