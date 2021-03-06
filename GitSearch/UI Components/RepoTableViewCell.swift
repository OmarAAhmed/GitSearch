//
//  TableViewCell.swift
//  GitSearch
//
//  Created by Omar Ahmed on 03/07/2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var highlightView: UIView!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var repoTitle: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure (with repo: Repo){
        userAvatar.configureAvatar(repo, image: &userAvatar)
        repoTitle.text = repo.name
        userNameLabel.text = repo.owner.login
        highlightView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        userAvatar.image = nil
    }
    
}
