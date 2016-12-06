//
//  AppDelegate.swift
//  Vesto macOS
//
//  Created by Nathan Flurry on 10/12/16.
//  Copyright © 2016 Vesto. All rights reserved.
//

import Cocoa
import QuarkmacOS

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create a window
        let viewController = ViewController()
        window = NSWindow(contentViewController: viewController)
        window?.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
