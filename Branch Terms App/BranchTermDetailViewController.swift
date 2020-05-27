//
//  BranchTermDetailViewController.swift
//  Branch Terms
//
//  Created by Michael Horn on 5/19/20.
//  Copyright © 2020 Mike Horn. All rights reserved.
//

import UIKit
import Branch

class BranchTermDetailViewController: UIViewController {

    var branchTermName: String = ""
    var branchDefinition: String = ""
    var buo = BranchUniversalObject()
    var lp = BranchLinkProperties()

    @IBOutlet weak var branchTermNameLabel: UILabel!
    @IBOutlet weak var branchDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        branchTermNameLabel.text = branchTermName
        branchDefinitionLabel.text = branchDefinition
        createContentReference(name: branchTermName, def: branchDefinition)
    }
    
    func createContentReference(name: String, def: String) {
        buo = BranchUniversalObject.init(canonicalIdentifier: "branchterm/12345")
        buo.title = name
        buo.contentDescription = def
        buo.imageUrl = "https://banner2.cleanpng.com/20180516/icw/kisspng-branch-metrics-mobile-deep-linking-logo-marketing-leaflets-5afcab538a7c23.7609386415265083715672.jpg"
        buo.publiclyIndex = true
        buo.locallyIndex = true
        buo.contentMetadata.customMetadata["branch_term_name"] = name
        buo.contentMetadata.customMetadata["branch_definition"] = def
        lp.channel = "sms"
        lp.feature = "sharing"
        lp.campaign = "COVID"
        lp.tags = [branchTermName, "share-term", "covid"]
        lp.addControlParam("$desktop_url", withValue: "https://branch.io/glossary/")
    }
    
    @IBAction func shareBranchTerm(sender: UIButton) {
        let message = "Learn about \(branchTermName)!"
        print(buo.contentMetadata)
        buo.showShareSheet(with: lp, andShareText: message, from: self) { (activityType, completed) in
          print(activityType ?? "")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
