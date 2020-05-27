//
//  BranchTermsTableViewController.swift
//  Branch Terms
//
//  Created by Michael Horn on 5/18/20.
//  Copyright © 2020 Mike Horn. All rights reserved.
//

import UIKit

class BranchTermsTableViewController: UITableViewController {

    struct Term {
        var name: String
        var definition: String
    }
    
    let terms = [
        Term(name: "Universal Links", definition: "Universal links are Apple's way of launching apps on their operating system from a website, also known as a web view. They link to content inside an app or website, giving iOS users an integrated mobile experience."),
        Term(name: "IDFA", definition: "IDFA is an acronym that stands for “ID (or identifier) for advertisers.” IDFA is the standard which Apple adopted that allows mobile advertising networks to track users and serve them targeted ads. Although the IDFA is unique to each iOS device, iOS users have the ability to reset their IDFA as well as control settings which grant more or less access to advertisers."),
        Term(name: "Deferred Deep Linking", definition: "Deferred deep links are mobile hosted links that are able to take the user to the intended content through the install process, basically matching the user who clicked a link in a paid or organic channel to the user who opened the app for the first time after installing it. Historically this has been done through fingerprinting.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return terms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchTermCell", for: indexPath)

        let term = terms[indexPath.row]
        cell.textLabel?.text = term.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Branch Terms"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedRowIndex = self.tableView.indexPathForSelectedRow
        let destinationViewController:BranchTermDetailViewController = segue.destination as! BranchTermDetailViewController
        destinationViewController.branchTermName = terms[selectedRowIndex!.row].name
        destinationViewController.branchDefinition = terms[selectedRowIndex!.row].definition
    }
}

// upon selection, copy over the definition to the next view to display it on the screen
// embedded in a navation controller OR a pop over that can be dismissed
// build in a way for in-app sharing
