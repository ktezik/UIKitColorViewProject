//
//  ViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 23.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
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
    
    // MARK: - Public Properties
    var delegate: ViewColorProtocol!
    
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = viewColor
        
        setSliders()
        
        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
    }
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = mainView.frame.width / 12
    }
    
    // MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redColorSlider:
            setValue(for: redColorLabel)
            setValue(for: redTextField)
        case greenColorSlider:
            setValue(for: greenColorLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueColorLabel)
            setValue(for: blueTextField)
        }
        
        labelColorVD()
    }
    
    
    @IBAction func doneButtonAction() {
        delegate.setNewValues(mainView.backgroundColor ?? .white)
        dismiss(animated: true)
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
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorLabel: label.text = backgroundColorVD(from: redColorSlider)
            case greenColorLabel: label.text = backgroundColorVD(from: greenColorSlider)
            default: label.text = backgroundColorVD(from: blueColorSlider)
            }
        }
    }
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = backgroundColorVD(from: redColorSlider)
            case greenTextField: textField.text = backgroundColorVD(from: greenColorSlider)
            default: textField.text = backgroundColorVD(from: blueColorSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
    }

    private func backgroundColorVD (from slider: UISlider) -> String {
        String(format: "%.2F", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
//MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redColorLabel)
            case greenTextField:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenColorLabel)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueColorLabel)
            }
            
            labelColorVD()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
