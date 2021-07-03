//
//  Repo.swift
//  GitSearch
//
//  Created by Omar Ahmed on 02/07/2021.
//

import Foundation


class Repo: Hashable{

    var id: Int!
    var name:String!
    var description: String!
    var url: String!
    var full_name:String!
    var owner: Owner!
    
    init(_ dict: [String:Any], newOwner: Owner) {
        self.id = dict["id"] as? Int
        self.name = dict["name"] as? String
        self.description = dict["description"] as? String
        self.url = dict["url"] as? String
        self.full_name = dict["full_name"] as? String
        self.owner = newOwner
    }
    
    static func == (lhs: Repo, rhs: Repo) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
