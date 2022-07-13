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
            brutForceView?.passwordLabel.textColor = isBlack ? .black : .white
            brutForceView?.changeBackgroundColorButton.backgroundColor = isBlack ? .systemOrange : .systemPurple
        }
    }
    
    // MARK: - LoadView
    override func loadView() {
        super.loadView()
        
        view = BruteForceView()
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusChange(for: .start)
        startBruteForce()
        changeBackgroundColor()
    }
    
    // MARK: - Action Elements
    private func startBruteForce() {
        brutForceView?.startBruteForceButton.addTarget(self, action: #selector(tapStartBruteForceButton), for: .touchUpInside)
    }
    
    private func changeBackgroundColor() {
        brutForceView?.changeBackgroundColorButton.addTarget(self, action: #selector(didTapColorChangeButton), for: .touchUpInside)
    }
    
    // MARK: - Action elements changes
    @objc func tapStartBruteForceButton() {
        statusChange(for: .progress)
        brutForceView?.passwordTextField.text = String().generatePassword()
        
        methodFlowTheStartButton()
    }
    
    func methodFlowTheStartButton() {
        let unlockPassword = brutForceView?.passwordTextField.text?.components(withMaxLength: 3) ?? [""]
        let queue = DispatchQueue(label: "BruteForce")
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

    @objc func didTapColorChangeButton() {
        isBlack.toggle()
    }
    
    func statusChange(for state: Status) {
        switch state {
        case .start:
            brutForceView?.passwordLabel.text = "Взломаем пароль?"
            brutForceView?.startBruteForceButton.setTitle("Взлом", for: .normal)
        case .progress:
            brutForceView?.passwordLabel.text = "Выполняется взлом. Это не займет много времени..."
            brutForceView?.activityIndicator.isHidden = false
            brutForceView?.activityIndicator.startAnimating()
            brutForceView?.passwordTextField.isSecureTextEntry = true
            brutForceView?.changeBackgroundColorButton.isHidden = false
            brutForceView?.startBruteForceButton.isUserInteractionEnabled = false
            brutForceView?.startBruteForceButton.setTitle("Производится взлом...", for: .normal)
        case .stop:
            brutForceView?.activityIndicator.isHidden = true
            brutForceView?.activityIndicator.stopAnimating()
            brutForceView?.passwordTextField.isSecureTextEntry = false
            brutForceView?.passwordLabel.text = "Пароль \(self.brutForceView?.passwordTextField.text ?? "")"
            brutForceView?.startBruteForceButton.isSelected = false
            brutForceView?.changeBackgroundColorButton.isHidden = true
            brutForceView?.startBruteForceButton.isUserInteractionEnabled = true
            brutForceView?.startBruteForceButton.setTitle("Повтор", for: .normal)
        }
    }
}

