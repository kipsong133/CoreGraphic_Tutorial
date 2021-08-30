//
//  ViewController.swift
//  CoreGraphic_Tutorial
//
//  Created by 김우성 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
    }

    @IBAction func pushButtonPressed(_ sender: PushButton) {
        
        if sender.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }
    
}

