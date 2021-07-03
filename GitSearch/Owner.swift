//
//  Owner.swift
//  GitSearch
//
//  Created by Omar Ahmed on 02/07/2021.
//

import Foundation

class Owner: Codable{
    var id: Int!
    var login:String!
    var avatar_url: String!
    var url: String!

    
    init(_ dict: [String:Any]) {
        self.id = dict["id"] as? Int
        self.login = dict["login"] as? String
        self.avatar_url = dict["avatar_url"] as? String
        self.url = dict["url"] as? String
    }
}
