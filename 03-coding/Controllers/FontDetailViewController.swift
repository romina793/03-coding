//
//  FontDetailViewController.swift
//  03-coding
//
//  Created by Romina Pozzuto on 27/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController {
    
//    MARK: OUTLET
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pickerFont: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    
//    MARK: PROPERTIES
    var familyName: String = ""
    var fonts: [String] = []

//    MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelTitle.text = familyName
        self.labelTitle.font = UIFont(name: familyName, size: 30.0)
        if fonts.count == 0 {
            self.pickerFont.isHidden = true
        }
        self.pickerFont.delegate = self
        self.pickerFont.dataSource = self
        self.textView.font = UIFont(name: familyName, size: 20.0)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
//    MARK: EXTENSION PICKER
extension FontDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: 20.0)
    }
}
