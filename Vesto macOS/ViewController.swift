//
//  ViewController.swift
//  Vesto macOS
//
//  Created by Nathan Flurry on 10/12/16.
//  Copyright © 2016 Vesto. All rights reserved.
//

import Cocoa
import QuarkmacOS
import QuarkExports

class ViewController: NSViewController {
    
    var quarkInstance: QuarkViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start quark
        startQuark()
    }

    func startQuark() {
        // Get the script
        let scriptUrl = Bundle.main.url(forResource: "main", withExtension: "js")
        
        // Create Quark
        let quark = QuarkViewController(script: try! String(contentsOf: scriptUrl!))
        quarkInstance = quark // Retain a reference to Quark
        
        // Handle exceptions
        quark.context.exceptionHandler = { context, value in
            if let value = value {
                print("⚠️ \(value)")
            } else {
                print("⚠️ Unkown error.")
            }
        }
        
        // Add child view controller
        addChildViewController(quark)
        view.addSubview(quark.view)
        quark.view.wantsLayer = true
        
        // Constrain the view
        quark.view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-10-[v]-10-|",
                options: [],
                metrics: nil,
                views: ["v": quark.view]
            ) +
            NSLayoutConstraint.constraints(
                    withVisualFormat: "V:|-10-[v]-10-|",
                    options: [],
                    metrics: nil,
                    views: ["v": quark.view]
            )
        )
    }
}
