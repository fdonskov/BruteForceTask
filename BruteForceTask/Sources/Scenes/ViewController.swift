//
//  ViewController.swift
//  BruteForceTask
//
//  Created by Федор Донсков on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
    }
    
    // MARK: - Functions
    
    func setupHierarchy() {
        setupView()
        createColorChangeButton()
    }
    
    func setupView() {
        self.bruteForce(passwordToUnlock: "1!gr")
    }
    
    func createColorChangeButton() {
        buttonChangingBackgroundColor.setTitle("Сменить тему", for: .normal)
        buttonChangingBackgroundColor.backgroundColor = .yellow
        
        buttonChangingBackgroundColor.translatesAutoresizingMaskIntoConstraints = false
        
        isBlack.toggle()
    }
    
    
    
    
    
    
    
    
    
    

}

