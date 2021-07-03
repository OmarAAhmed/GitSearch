//
//  Networking.swift
//  GitSearch
//
//  Created by Omar Ahmed on 02/07/2021.
//

import Foundation


class User {
    var id : Int = 0
    var name: String = ""
}
class Networking{
    
    public static let shared: Networking = Networking()
    
    var baseURL = "https://api.github.com/repositories"
    var results = Set<Repo>()
    
    func fetch(){
        if let url = URL.init(string: baseURL){
            let task = URLSession.shared.dataTask(with: url, completionHandler: { [self](data, response, error) in
                setResult(data!)
            })
            task.resume()
            
        }
    }
    
    func setResult(_ data: Data) {
        if let objData = try? JSONSerialization.jsonObject(with: data, options: []){
            if let dict = objData as? [[String: Any]]{
                for item in dict{
                    let owner = Owner(item["owner"] as! [String : Any])
                    let repo = Repo(item, newOwner: owner)
                    results.insert(repo)
                }
            }
            print(results.count)
        }
    }
}


