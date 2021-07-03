//
//  ViewController.swift
//  GitSearch
//
//  Created by Omar Ahmed on 02/07/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var presenter = MainPresenter()
    
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "repoTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter.fetchRepos(completion: {
            DispatchQueue.main.async {
                self.refresh()
            }
        })
    }
    
    func createAlertMessage(){
        let myalert = UIAlertController(title: "", message: "Minimum search query is 2 letters", preferredStyle: UIAlertController.Style.alert)
        
        myalert.addAction(UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction!) in
            print("Selected")
        })
        self.present(myalert, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RepoDetailsViewController{
            destination.repo = presenter.selectedRepo
        }
    }
    
}

extension MainViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.activeRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoTableViewCell") as! RepoTableViewCell
        cell.selectionStyle = .none
        cell.configure(with:presenter.activeRepos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedRepo = presenter.activeRepos[indexPath.row]
        performSegue(withIdentifier: "RepoDetailsSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height * 0.2
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func handleTableViewVisibility(){
        if  presenter.activeRepos.count > 0 {
            tableView.isHidden = false
        }else{
            tableView.isHidden = true
        }
    }
    
    func refresh(){
        handleTableViewVisibility()
        tableView.reloadData()
    }
    
}

extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if ((searchBar.text?.isEmpty) == false){
            if searchBar.text!.count > 2 {
                presenter.filterWithQuery(query: searchBar.text!)
                refresh()
            } else {
                createAlertMessage()
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if ((searchBar.text?.isEmpty) == false){
            if searchBar.text!.count > 2 {
                presenter.filterWithQuery(query: searchBar.text!)
            }
        } else {
            presenter.reset()
        }
        refresh()
    }
}
