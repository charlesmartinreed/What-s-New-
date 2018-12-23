//
//  ViewController.swift
//  What's New?
//
//  Created by Charles Martin Reed on 12/22/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var hasNewUpdates = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //called here because we cannot present another view controller during the viewDidLoad lifecycle
        whatsNewIfNeeded()
    }
    
    func whatsNewIfNeeded() {
        let items = [
            WhatsNew.Item(
                title: "A New America",
                subtitle: "Making America Great, for Everyone, for the first time.",
                image: UIImage(named: "feature1")),
            WhatsNew.Item(
                title: "A New America",
                subtitle: "Making America Great, for Everyone, for the first time.",
                image: UIImage(named: "feature2")),
            WhatsNew.Item(
                title: "A New America",
                subtitle: "Making America Great, for Everyone, for the first time.",
                image: UIImage(named: "feature3")),
            WhatsNew.Item(
                title: "A New America",
                subtitle: "Making America Great, for Everyone, for the first time.",
                image: UIImage(named: "feature4"))
            ]
        
        //MARK:- custom theme configuration
        let theme = WhatsNewViewController.Theme { configuration in
            configuration.apply(animation: .fade)
            configuration.backgroundColor = UIColor(named: "bgColor")!
            configuration.titleView.titleColor = UIColor(named: "lightText")!
            configuration.itemsView.titleColor = UIColor(named: "lightText")!
            configuration.itemsView.subtitleColor = UIColor(named: "lightText")!
            configuration.completionButton.backgroundColor = UIColor(named: "iconColor")!
        }
        let config = WhatsNewViewController.Configuration(theme: theme)
        
        //MARK:- Key-value version store
        //use this to store whether or not the user has been presented with your "what's new" screen before
        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: UserDefaults.standard) //alternatively, this can be tied into iCloud for universal apps that a user might experience on multiple devices
        
        //using a predefined style
        let whatsNew = WhatsNew(title: "2020", items: items)
        let whatsNewVC = WhatsNewViewController(whatsNew: whatsNew, configuration: config, versionStore: keyValueVersionStore)
        
        //whatsNewVC controller is now an optional
        if let vc = whatsNewVC {
             //present the view controller
            present(vc, animated: true, completion: nil)
        }
       
    }
}

