//
//  HomePresenter.swift
//  BrastleWark
//
//  Created by Luis Arturo Gutiérrez on 6/6/19.
//  Copyright © 2019 Luis Arturo Gutiérrez. All rights reserved.
//

import Foundation

protocol HomeView {
  
  func performGetTownDataSuccess(data: [Gnome])
  func performGetTownDataError(error: String)
  
}

class HomePresenter {
  var homeView: HomeView?
  
  init(view: HomeView) {
    homeView = view
  }
  
  func performTownData() {
    let service = ServiceManager()
    service.initWithURl { (success, obj) in
      if  success {
        guard let data = obj as? [Gnome] else { return }
        self.homeView?.performGetTownDataSuccess(data: data)
      } else {
        self.homeView?.performGetTownDataError(error: "No data loaded")
      }
    }
  }
}
