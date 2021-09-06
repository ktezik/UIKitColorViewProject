//
//  NavigationViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 06.09.2021.
//

import UIKit

class NavigationViewController: UIViewController {

    var redColorValue: Float!
    var greenColorValue: Float!
    var blueColorValue: Float!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settings = segue.destination as? SettingsViewController else { return }
        settings.redColorSliderClone = redColorValue
        settings.greenColorSliderClone = greenColorValue
        settings.blueColorSliderClone = blueColorValue
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let color = segue.source as? SettingsViewController else { return }
        view.backgroundColor = UIColor(
            red: CGFloat(color.redColorSlider.value),
            green: CGFloat(color.greenColorSlider.value),
            blue: CGFloat(color.blueColorSlider.value),
            alpha: 1)
        redColorValue = color.redColorSlider.value
        greenColorValue = color.greenColorSlider.value
        blueColorValue = color.blueColorSlider.value
    }
}
