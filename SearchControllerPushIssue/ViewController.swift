//
//  ViewController.swift
//  SearchControllerPushIssue
//
//  Created by Sven Bacia on 14.10.17.
//  Copyright © 2017 Sven Bacia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private lazy var searchController: UISearchController = { [unowned self] in
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup search controller
        definesPresentationContext = true
        
        // place searchController in navigation item
        navigationItem.searchController = searchController
    }
    
    @IBAction func activateSearchBar() {
        // force the searchBar to appear
        searchController.isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "2. Push ViewController"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard!.instantiateViewController(withIdentifier: "Next")
        show(viewController, sender: self)
    }
}
