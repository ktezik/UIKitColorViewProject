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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: ViewColorProtocol!
    
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationViewColor()
        setLabelsValues()
        labelColorVD()
        
    }
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = mainView.frame.width / 12
    }
    
    @IBAction func redSliderAction() {
        labelColorVD()
    }
    @IBAction func greenSliderAction() {
        labelColorVD()
    }
    @IBAction func blueSliderAction() {
        labelColorVD()
    }
    
    @IBAction func doneButtonAction() {
        delegate.setNewValues(mainView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

//MARK: - Extension
extension SettingsViewController: UITextFieldDelegate {
    private func labelColorVD() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1)
        
        blueColorLabel.text = backgroundColorVD(from: blueColorSlider)
        blueTextField.text = backgroundColorVD(from: blueColorSlider)
        
        greenColorLabel.text = backgroundColorVD(from: greenColorSlider)
        greenTextField.text = backgroundColorVD(from: greenColorSlider)
        
        redColorLabel.text = backgroundColorVD(from: redColorSlider)
        redTextField.text = backgroundColorVD(from: redColorSlider)
    }
    
    private func backgroundColorVD (from slider: UISlider) -> String {
        String(format: "%.2F", slider.value)
    }
    
    private func navigationViewColor() {
        let ciColor = CIColor(color: viewColor ?? .blue)
        
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
    }

    private func setLabelsValues() {
        redTextField.text = backgroundColorVD(from: redColorSlider)
        greenTextField.text = backgroundColorVD(from: greenColorSlider)
        blueTextField.text = backgroundColorVD(from: blueColorSlider)
        
        redColorLabel.text = backgroundColorVD(from: redColorSlider)
        greenColorLabel.text = backgroundColorVD(from: greenColorSlider)
        blueColorLabel.text = backgroundColorVD(from: blueColorSlider)
    }
}
