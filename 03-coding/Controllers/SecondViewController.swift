//
//  SecondViewController.swift
//  03-coding
//
//  Created by Romina Pozzuto on 26/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelGoldNum: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textViewResult: UITextView!
    
    var fibonacci: [Int]  = [0, 1]
    var fibuID = 1
    var wantsGoldNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateLabel(id: Int(stepper.value))
    }

    func generateFibonattiNumber(){
        fibonacci  = [0, 1]
        for i in 2...fibuID {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        print(fibonacci)
        let fibStr: [String] = fibonacci.compactMap {String ($0)}
        let result: String = fibStr.joined(separator: "\n")
        self.textViewResult.text = result
        
    }
    
    func upDateLabel(id: Int) {
        fibuID = id
        labelNumber.text = "\(fibuID)"
        generateFibonattiNumber()
        calculateGoldNum()
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        upDateLabel(id: Int(stepper.value))
    }
    

    @IBAction func switchMoved(_ sender: UISwitch) {
        wantsGoldNum = sender.isOn
        calculateGoldNum()
    }
    
    func calculateGoldNum()  {
        if wantsGoldNum{
            let last = Double(fibonacci[fibonacci.count - 1])
            let previous = Double(fibonacci[fibonacci.count - 2])
            let goldNumber = last / previous
            self.labelGoldNum.text = "\(goldNumber)"
        } else {
            self.labelGoldNum.text = "VER EL NÚMERO AUREO"
        }
    }
    

}

