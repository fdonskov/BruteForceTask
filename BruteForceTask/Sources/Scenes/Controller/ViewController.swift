//
//  ViewController.swift
//  BruteForceTask
//
//  Created by Федор Донсков on 12.07.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
     var brutForceView: BruteForceView? {
         guard isViewLoaded else { return nil }
         return view as? BruteForceView
     }

     var brute = OperationBruteForce()
    
    // MARK: - Calculated properties
    private var isBlack: Bool = true {
        didSet {
            brutForceView?.backgroundColor = isBlack ? .white : .black
            brutForceView?.labelPassword.textColor = isBlack ? .black : .white
            brutForceView?.buttonChangingBackgroundColor.backgroundColor = isBlack ? .systemOrange : .systemPink
        }
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = BruteForceView()
        
        statusChange(for: .start)
        buttonStartBruteForceAction()
        buttonChangingBackgroundColorAction()
    }
    
    // MARK: - Action Elements
    private func buttonStartBruteForceAction() {
        brutForceView?.buttonStartBruteForce.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    private func buttonChangingBackgroundColorAction() {
        brutForceView?.buttonChangingBackgroundColor.addTarget(self, action: #selector(tapButtonColorChange), for: .touchUpInside)
    }
    
    // MARK: - Action elements changes
    @objc func tapButton() {
        statusChange(for: .progress)
        brutForceView?.textFieldPassword.text = String().generatePassword()
        let unlockPassword = brutForceView?.textFieldPassword.text?.components(withMaxLength: 3) ?? [""]
        let queue = DispatchQueue(label: "BruteForce", qos: .default, attributes: .concurrent)
        let bruteForce = DispatchWorkItem { [self] in
            for character in unlockPassword {
                brute.bruteForce(passwordToUnlock: character)
            }
        }

        bruteForce.notify(queue: .main) { [self] in
            statusChange(for: .stop)
        }
        
        queue.async(execute: bruteForce)
    }

    @objc func tapButtonColorChange() {
        isBlack.toggle()
    }
    
    func statusChange(for value: Status) {
        switch value {
        case .start:
            brutForceView?.labelPassword.text = "Взломаем пароль?"
            brutForceView?.buttonStartBruteForce.setTitle("Взлом", for: .normal)
        case .progress:
            brutForceView?.labelPassword.text = "Выполняется взлом. Это не займет много времени..."
            brutForceView?.activityIndicator.isHidden = false
            brutForceView?.activityIndicator.startAnimating()
            brutForceView?.textFieldPassword.isSecureTextEntry = true
            brutForceView?.buttonChangingBackgroundColor.isHidden = false
            brutForceView?.buttonStartBruteForce.isUserInteractionEnabled = false
            brutForceView?.buttonStartBruteForce.setTitle("Собираю информацию о пароле...", for: .normal)
        case .stop:
            brutForceView?.activityIndicator.isHidden = true
            brutForceView?.activityIndicator.stopAnimating()
            brutForceView?.textFieldPassword.isSecureTextEntry = false
            brutForceView?.labelPassword.text = "Пароль \(self.brutForceView?.textFieldPassword.text ?? "")"
            brutForceView?.buttonStartBruteForce.isSelected = false
            brutForceView?.buttonChangingBackgroundColor.isHidden = true
            brutForceView?.buttonStartBruteForce.isUserInteractionEnabled = true
            brutForceView?.buttonStartBruteForce.setTitle("Повтор", for: .normal)
        }
    }
}

