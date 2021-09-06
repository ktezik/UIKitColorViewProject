//
//  ViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 23.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    var redColorSliderClone: Float!
    var greenColorSliderClone: Float!
    var blueColorSliderClone: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let redColor = redColorSliderClone {
            redColorSlider.value = redColor
        } else {
            redColorSlider.value = 0.25
        }
        if let greenColor = greenColorSliderClone {
            greenColorSlider.value = greenColor
        } else {
            greenColorSlider.value = 0.25
        }
        if let blueColor = blueColorSliderClone {
            blueColorSlider.value = blueColor
        } else {
            blueColorSlider.value = 0.25
        }
        
        redColorLabel.text = backgroundColorVD(from: redColorSlider)
        greenColorLabel.text = backgroundColorVD(from: greenColorSlider)
        blueColorLabel.text = backgroundColorVD(from: blueColorSlider)
        
        labelColorVD()
    }
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = mainView.frame.width / 12
    }
    
    @IBAction func redSliderAction() {
        redColorLabel.text = backgroundColorVD(from: redColorSlider)
        
        labelColorVD()
    }
    @IBAction func greenSliderAction() {
        greenColorLabel.text = backgroundColorVD(from: greenColorSlider)
        
        labelColorVD()
    }
    @IBAction func blueSliderAction() {
        blueColorLabel.text = backgroundColorVD(from: blueColorSlider)
        
        labelColorVD()
    }
    
}

//MARK: - Extension
extension SettingsViewController {
    private func labelColorVD() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1)
    }
    
    private func backgroundColorVD (from slider: UISlider) -> String {
        String(format: "%.2F", slider.value)
    }
}
