//
//  MainPresenter.swift
//  GitSearch
//
//  Created by Omar Ahmed on 03/07/2021.
//

import Foundation


class MainPresenter{
    
    var repos = [Repo]()
    var activeRepos = [Repo]()
    var selectedRepo: Repo!
    
    func fetchRepos(completion: @escaping ()->()) {
        Networking.shared.fetch(){
            (newRepos) in
            self.repos = Array(newRepos)
            self.activeRepos = self.repos
            completion()
        }
    }
    
    func filterWithQuery (query: String){
        activeRepos = repos.filter{
            repo in
            return repo.full_name.lowercased().contains(query.lowercased())
        }
    }
    func reset(){
        activeRepos = repos
    }
}
