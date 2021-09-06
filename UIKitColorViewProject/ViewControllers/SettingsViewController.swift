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
    
    var redColorSliderClone: Float!
    var greenColorSliderClone: Float!
    var blueColorSliderClone: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationColorValues()
        
        redTextField.text = backgroundColorVD(from: redColorSlider)
        greenTextField.text = backgroundColorVD(from: greenColorSlider)
        blueTextField.text = backgroundColorVD(from: blueColorSlider)
        
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
        redTextField.text = backgroundColorVD(from: redColorSlider)
        
        labelColorVD()
    }
    @IBAction func greenSliderAction() {
        greenColorLabel.text = backgroundColorVD(from: greenColorSlider)
        greenTextField.text = backgroundColorVD(from: greenColorSlider)
        
        labelColorVD()
    }
    
    
    
    @IBAction func blueSliderAction() {
        blueColorLabel.text = backgroundColorVD(from: blueColorSlider)
        blueTextField.text = backgroundColorVD(from: blueColorSlider)
        
        labelColorVD()
    }
    
    @IBAction func doneButtonAction() {
        delegate.setNewValues(sliderValues: redColorSlider.value, sliderValues: greenColorSlider.value, sliderValues: blueColorSlider.value)
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
    }
    
    private func backgroundColorVD (from slider: UISlider) -> String {
        String(format: "%.2F", slider.value)
    }
    
    private func navigationColorValues() {
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
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        view.endEditing(true)
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField  {
//            passwordOutlet.becomeFirstResponder()
//        } else {
//            performSegue(withIdentifier: "welcomeVC", sender: nil)
//        }
//        return true
//    }
}
