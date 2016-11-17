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
    
    var quarkInstance: Quark?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }

    @IBAction func startQuark(sender: NSButton) {
        startQuark()
    }

    func startQuark() {
        // Get the script
        let scriptUrl = Bundle.main.url(forResource: "main", withExtension: "js")
        
        // Create Quark
        let quark = Quark(script: try! String(contentsOf: scriptUrl!))
        quarkInstance = quark // Retain a reference to Quark
        
        // Handle exceptions
        quark.context.exceptionHandler = { context, value in
            if let value = value {
                print("⚠️ \(value)")
            } else {
                print("⚠️ Unkown error.")
            }
        }
        
        // Set the parent view so it can manipulate objects
        quark.context.setObject(try! QKView(nsView: view), forKeyedSubscript: NSString(string: "parentView"))
        
        // Start Quark
        quark.start()
    }
}
