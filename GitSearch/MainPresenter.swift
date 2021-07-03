//
//  MainPresenter.swift
//  GitSearch
//
//  Created by Omar Ahmed on 03/07/2021.
//

import Foundation


class MainPresenter{
    
    var repos = [Repo]()
    
    func fetchRepos(completion: @escaping ()->()) {
        Networking.shared.fetch(){
            (newRepos) in
            self.repos = Array(newRepos)
            completion()
        }
    }
}
