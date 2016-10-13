//
//  ViewController.swift
//  Vesto macOS
//
//  Created by Nathan Flurry on 10/12/16.
//  Copyright © 2016 Vesto. All rights reserved.
//

import Cocoa
import QuarkmacOS

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startQuark(sender: NSButton) {
        // Get the script
        let scriptUrl = Bundle.main.url(forResource: "main", withExtension: "js")
        
        // Create Quark
        let quark = Quark(script: try! String(contentsOf: scriptUrl!))
        
        // Handle exceptions
        quark.context.exceptionHandler = { context, value in
            print("⚠️ \(value)")
        }
        
        // Start Quark
        quark.start()
    }

}
