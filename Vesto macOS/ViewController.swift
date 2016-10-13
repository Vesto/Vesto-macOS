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
        let quark = Quark(script:
            "var button = Button(5)\n"
        )
        quark.start()
        quark.context.exceptionHandler = { context, value in
            print("Exception \(value)")
        }
        let button = quark.context.evaluateScript("new Button({'5':10})").toObjectOf(NSButton.self) as! NSButton
        quark.context.evaluateScript("Logger.print(5)")
        button.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        view.addSubview(button)
    }

}

