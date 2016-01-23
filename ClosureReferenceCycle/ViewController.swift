//
//  ViewController.swift
//  ClosureReferenceCycle
//
//  Created by Jacques.
//  Copyright © 2016 Jacques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func triggerLeak(sender: AnyObject) {
        
        let htmlElement = HTMLElement(name: "h1", text: "default text")
        
        // MARK: The call trigerring the memory leak (asHTML).
        let value = htmlElement.asHTML
        
        print("HTML element value: \(value)")
    }
}

