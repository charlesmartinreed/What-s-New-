//
//  ViewController.swift
//  What's New?
//
//  Created by Charles Martin Reed on 12/22/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

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
        
        //using a predefined style
        let whatsNew = WhatsNew(title: "2020", items: items)
        let whatsNewVC = WhatsNewViewController(whatsNew: whatsNew)
        
        //present the view controller
        present(whatsNewVC, animated: true, completion: nil)
    }
}

