//
//  TableViewCell.swift
//  GitSearch
//
//  Created by Omar Ahmed on 03/07/2021.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var repoTitle: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    
    func configure (with repo: Repo){
        userAvatar.configureAvatar(repo, image: &userAvatar)
        repoTitle.text = repo.full_name
        userNameLabel.text = repo.owner.login
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        userAvatar.image = nil
    }
    
}
