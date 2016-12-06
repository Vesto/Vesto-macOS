//
//  ViewController.swift
//  Vesto macOS
//
//  Created by Nathan Flurry on 10/12/16.
//  Copyright © 2016 Vesto. All rights reserved.
//

import Cocoa
import QuarkmacOS
import QuarkCore

class ViewController: NSViewController {
    
    var quarkInstance: QuarkViewController?

    override func loadView() {
        // Load an empty view

        view = NSView()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start quark
        do {
            try startQuark()
        } catch {
            print("Could not start Quark. \(error)")
        }
    }

    private func startQuark() throws {
        // Get the module path and URL
        let modulePath = "/Users/NathanFlurry/Documents/Dev/Vesto/Code/test-module"
        let moduleURL = URL(fileURLWithPath: modulePath, isDirectory: true)
        
        // Create Quark
        let quark = try QuarkViewController(module: try QKModule(url: moduleURL))
        quarkInstance = quark // Retain a reference to Quark
        
        // Handle exceptions
        quark.instance.context.exceptionHandler = { context, value in
            print("~~~")

//            print(context!.globalObject.toDictionary())

            if let value = value {
                print("⚠️ \(value)")
            } else {
                print("⚠️ Unkown error.")
            }
            
            guard let value = value else {
                return
            }
            
            // Get data from error
            guard let stack = value.objectForKeyedSubscript("stack").toString() else {
                print("Could not get error data.")
                return
            }
            let line = Int(value.objectForKeyedSubscript("line").toInt32())
            let column = Int(value.objectForKeyedSubscript("column").toInt32())
            
            // Print the data
            print("Line: \(line) Column: \(column) Stack:\n\(stack)")
            
            do {
                let sourceMap = QKSourceMap(sourceMap: quark.instance.module.sourceMap)
                print(try sourceMap.originalPositionFor(line: line, column: column))
            } catch {
                print("Could not get original position from source map. \(error)")
            }
            print("~~~")
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
