//
//  ViewController.swift
//  GitSearch
//
//  Created by Omar Ahmed on 02/07/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter = MainPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "repoTableViewCell")
        presenter.fetchRepos(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })

        // Do any additional setup after loading the view.
    }

}

extension MainViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoTableViewCell") as! RepoTableViewCell
        cell.configure(with:presenter.repos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height * 0.18
    }
}

