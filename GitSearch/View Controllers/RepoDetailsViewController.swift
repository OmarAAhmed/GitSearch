//
//  RepoDetailsViewController.swift
//  GitSearch
//
//  Created by Omar Ahmed on 03/07/2021.
//

import UIKit

class RepoDetailsViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var fullPath: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var stackViewContainer: UIView!
    
    var repo: Repo!
     func configureView() {
        avatar.downloaded(from: repo.owner.avatar_url)
        avatar.configureAvatar(repo, image: &avatar)
        titleLabel.text = repo.name
        descriptionLabel.text = repo.description
        id.text = "\(repo.id ?? -1)"
        fullPath.text = repo.full_name
        urlLabel.text = repo.url
        ownerLabel.text = repo.owner.login
        stackViewContainer.layer.cornerRadius = 10
        stackViewContainer.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }


}
