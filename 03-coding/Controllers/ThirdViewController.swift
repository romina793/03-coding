//
//  ThirdViewController.swift
//  03-coding
//
//  Created by Romina Pozzuto on 26/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
//    MARK: OUTLET
    @IBOutlet weak var tableView: UITableView!
    
//    MARK: PROPERTIES
    var families: [String] = []
    var fonts: [String: [String]] = [:]
    
    
//    MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        families = UIFont.familyNames.sorted(by: {return $0 < $1})
        for fam in families {
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        print(fonts)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFontsForFamily"{
            let navigationController = segue.destination as? UINavigationController
            let destinationVC = navigationController?.topViewController as? FontDetailViewController
            guard let index = self.tableView.indexPathForSelectedRow?.row else {return}
            destinationVC?.familyName = families[index]
            guard let fontsFamily = self.fonts[self.families[index]] else {return}
            destinationVC?.fonts = fontsFamily
        }
    }
    
}
//    MARK: EXTENSION TABLEVIEW
extension ThirdViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        let fontFamily = self.families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }
    
}
extension ThirdViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFont = fonts[fontFamily]
        print(familyFont)
    }
}
