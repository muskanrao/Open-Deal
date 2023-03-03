//
//  LocationViewController.swift
//  openDeal
//
//  Created by Muskan on 18/02/23.
//

import UIKit

class LocationViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchBar = UISearchBar()
    var inSeachMode = false
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewComponents()
        view.backgroundColor = .black
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
          guard let text = searchController.searchBar.text else{
              return
          }
          print(text)
      }
      
    
    
      @objc func showSearchBar(){
          print("search")
          configureSeachBar()
      }
      
      
     
      
      func configureSeachBar(){
          searchBar = UISearchBar()
          searchBar.delegate = self
          searchBar.sizeToFit()
          searchBar.showsCancelButton = true
          searchBar.becomeFirstResponder()
          searchBar.tintColor = .black
          searchBar.barTintColor = .systemPink
          navigationItem.rightBarButtonItem = nil
          navigationItem.titleView = searchBar
      }
      func configureSearchBarButton() {
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
          navigationItem.rightBarButtonItem?.tintColor = .white
      }
      
      func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          navigationItem.titleView = nil
          configureSearchBarButton()
          inSeachMode = false

      }
      
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          
          if searchText == "" || searchBar.text == nil {
              inSeachMode = false
      
              view.endEditing(true)
          } else {
              inSeachMode = true
          
            
          }
      }
      
      func configureViewComponents(){
          
         /*
          navigationController?.navigationBar.backgroundColor = .white
          let appearance = UINavigationBarAppearance()
          appearance.configureWithTransparentBackground()
          appearance.backgroundColor = .white
          
          navigationController?.navigationBar.scrollEdgeAppearance = appearance
          navigationItem.title = "Location"
          */
         
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
          searchController.searchResultsUpdater = self
          navigationItem.searchController = searchController
      
          
          
      }

}
