//
//  ThirdViewController.swift
//  03-coding
//
//  Created by Romina Pozzuto on 26/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var families: [String] = []
    var fonts: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let families = UIFont.familyNames
        for fam in families {
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        
        print(fonts)
    }
    
}
