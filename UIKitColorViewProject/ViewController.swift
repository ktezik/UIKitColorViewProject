//
//  ViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redColorLabel.text = String(redColorSlider.value)
        greenColorLabel.text = String(greenColorSlider.value)
        blueColorLabel.text = String(blueColorSlider.value)
    }
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = mainView.frame.width / 12
    }
    
    @IBAction func redSliderAction() {
        redColorLabel.text = String(redColorSlider.value)
    }
    @IBAction func greenSliderAction() {
        greenColorLabel.text = String(greenColorSlider.value)
    }
    @IBAction func blueSliderAction() {
        blueColorLabel.text = String(blueColorSlider.value)
    }
    
}

