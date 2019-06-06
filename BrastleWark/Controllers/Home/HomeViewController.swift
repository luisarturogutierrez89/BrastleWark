//
//  ViewController.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
  
  var homePresenter: HomePresenter?
    
    @IBOutlet weak var gnomesTableView: UITableView!
    
    var gnomes = [Gnome]()
    var filterGonmes = [Gnome]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    homePresenter = HomePresenter(view: self)
    setupUI()
    getData()
  }
  
  func setupUI() {
    self.view.backgroundColor = .black
    title = "Welcome to BrastleWark"
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    search.searchBar.placeholder = "Buscar"
    search.delegate = self
    self.navigationItem.searchController = search
    
  }
    
    func getData() {
        homePresenter?.performTownData()
    }

}

extension HomeViewController: HomeView {
  func performGetTownDataSuccess(data: [Gnome]) {
    gnomes = data
    filterGonmes = data
    DispatchQueue.main.async { // Correct
        self.gnomesTableView.reloadData()
    }
  }
  
  func performGetTownDataError(error: String) {
    let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

extension HomeViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        if text == "" {
            filterGonmes = gnomes
            gnomesTableView.reloadData()
            return
        }
        
        filterGonmes = filterGonmes.filter({
            ($0.name?.lowercased().contains(text!.lowercased()))!
        })
        filterGonmes =  filterGonmes.count == 0 ? gnomes : filterGonmes
        gnomesTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! BasicCell
        
        let gnome = filterGonmes[indexPath.row]
        cell.nameLbl.text = "Name: \(gnome.name ?? "")"
        cell.idLbl.text = "ID: \(gnome.id ?? 0)"
        cell.professionsCountLbl.text = "Professions: \(gnome.professions.count)"
        cell.friendsLbl.text = "Friends: \(gnome.friends.count)"
        cell.profilaImage.image = UIImage(named: "profileImage")
        
        guard let url = filterGonmes[indexPath.row].thumbnail else {
            return cell
        }
        cell.profilaImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profileImage"))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterGonmes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        controller.gnome = gnomes[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
