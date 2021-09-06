//
//  NavigationViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 06.09.2021.
//

import UIKit

protocol ViewColorProtocol {
    func setNewValues(sliderValues red: Float, sliderValues green: Float, sliderValues blue: Float)
}

class NavigationViewController: UIViewController {

    var redColorValue: Float!
    var greenColorValue: Float!
    var blueColorValue: Float!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settings = segue.destination as? SettingsViewController else { return }
        settings.redColorSliderClone = redColorValue
        settings.greenColorSliderClone = greenColorValue
        settings.blueColorSliderClone = blueColorValue
        settings.delegate = self
    }
}

extension NavigationViewController: ViewColorProtocol {
    func setNewValues(sliderValues red: Float, sliderValues green: Float, sliderValues blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1)
        redColorValue = red
        greenColorValue = green
        blueColorValue = blue
    }
    
}
