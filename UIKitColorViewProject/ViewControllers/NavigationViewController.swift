//
//  NavigationViewController.swift
//  UIKitColorViewProject
//
//  Created by Иван Гришин on 06.09.2021.
//

import UIKit

protocol ViewColorProtocol {
    func setNewValues(_ color: UIColor)
}

class NavigationViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settings = segue.destination as? SettingsViewController else { return }
        settings.viewColor = view.backgroundColor
        settings.delegate = self
    }
}

extension NavigationViewController: ViewColorProtocol {
    func setNewValues(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
