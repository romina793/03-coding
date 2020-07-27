//
//  FirstViewController.swift
//  03-coding
//
//  Created by Romina Pozzuto on 26/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
//    MARK: OUTLET
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    

//    MARK: PROPERTIES
    var userAge = 0
    var userName = ""
    

//    MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateAgeLabel()
    }

    
    @IBAction func sliderAgeMove(_ sender: UISlider) {
        upDateAgeLabel()
        
    }
    
    func upDateAgeLabel() {
        userAge = Int(sliderAge.value)
        labelAge.text = "\(userAge)"
    }
    
    @IBAction func validateData(_ sender: Any) {
        
        let shouldEnterTheParty = (userName == "Romina Pozzuto") || userAge > 18
        
        if shouldEnterTheParty{
            print("Bienvenide a la fiesta!!")
            view.backgroundColor = UIColor.green
        } else{
            print("Los siento, esta fiesta es privada...")
             view.backgroundColor = UIColor.red
        }
    }
    

}

//    MARK: EXTENSION TEXTFIELD
extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        if let textFieldString = textField.text {
            userName = textFieldString
        }
        return true
    }
}
