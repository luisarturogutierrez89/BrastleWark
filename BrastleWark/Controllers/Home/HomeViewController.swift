//
//  ViewController.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var homePresenter: HomePresenter?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    homePresenter = HomePresenter(view: self)
    setupUI()
  }
  
  func setupUI() {
    self.view.backgroundColor = .green
    title = "Welcome to BrastleWark"
  }


}

extension HomeViewController: HomeView {
  func performGetTownDataSuccess(data: [Gnome]) {
    
  }
  
  func performGetTownDataError(error: String) {
    let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  
}
