//
//  HTMLElement.swift
//  ClosureReferenceCycle
//
//  Created by Jacques.
//  Copyright © 2016 Jacques. All rights reserved.
//

class HTMLElement {

    let name: String
    let text: String?
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) has been deinitialised")
    }
    
    // MARK: The code below creates a reference cycle by using "self" within a closure without specifying the reference kind (strong, weak, unowned), which by default is "strong", thus creating a memory leak.
    lazy var asHTML: Void -> String = {
        // MARK: Uncomment the code below to solve the memory leak by declaring "self" as an "unowned" reference.
//        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(self.text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    // MARK: An alternative to the asHTML property without memory leak issue using a function. 
    static func asHTML2(name: String, text: String?) -> String {
        if let text = text {
            return "<\(name)>\(text)</\(name)>"
        } else {
            return "</\(name)>"
        }
    }
}