//
//  View.swift
//  BruteForceTask
//
//  Created by Федор Донсков on 12.07.2022.
//

import UIKit

class BruteForceView: UIView {
    
    // MARK: - Properties
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var passwordLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = MetricSize.infoLabelNumberOfLines
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: MetricSize.infoLabelFont)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.isHidden = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = MetricSize.textFieldLayerCornerRadius
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var changeBackgroundColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = MetricSize.buttonColorReplacementLayerCornerRadius
        button.setTitle("Сменить тему", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var startBruteForceButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.layer.cornerRadius = MetricSize.changeStatusButtonCornerRadius
        button.backgroundColor = .systemMint
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initial
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierarchy()
    }
    
    // MARK: - SetupHierarchy
    func setupHierarchy() {
        addSubview(stackView)
        
        stackView.addSubview(activityIndicator)
        stackView.addSubview(passwordTextField)
        stackView.addSubview(passwordLabel)
        stackView.addSubview(startBruteForceButton)
        stackView.addSubview(changeBackgroundColorButton)
        
        createConstraints()
    }
    
    // MARK: - Create Constraints Method
    func createConstraints() {
        constraintStackView()
        constraintLabelPassword()
        constraintActivityIndicator()
        constraintTextFieldPassword()
        constraintButtonChangingBackgroundColor()
        constraintButtonStartBruteForce()
    }
    
    // MARK: - Create Constraints Elements
   func constraintStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: MetricSize.stackViewTopAndLeadingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: MetricSize.stackViewTopAndLeadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: MetricSize.stackViewTrailingAndBottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: MetricSize.stackViewTrailingAndBottomAnchor)
        ])
    }
    
    func constraintLabelPassword() {
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: startBruteForceButton.bottomAnchor, constant: MetricSize.infoLabelTopAnchorConstraint),
            passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
    }
    
    func constraintActivityIndicator() {
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: stackView.topAnchor, constant: MetricSize.activityIndicatorTopAnchorConstraint),
            activityIndicator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: MetricSize.activityIndicatorLeadingAnchorConstraint),
            activityIndicator.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: MetricSize.activityIndicatorTrailingAnchorConstraint)
        ])
    }
    
    func constraintTextFieldPassword() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: MetricSize.textFieldTopAnchorConstraint),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: MetricSize.textFieldLeadingAnchorConstraint),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: MetricSize.textFieldTrailingAnchorConstraint)
        ])
    }
    
    func constraintButtonChangingBackgroundColor() {
        NSLayoutConstraint.activate([
            changeBackgroundColorButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: MetricSize.buttonColorReplacementTopAnchorConstraint),
            changeBackgroundColorButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            changeBackgroundColorButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
    }
    
    func constraintButtonStartBruteForce() {
        NSLayoutConstraint.activate([
            startBruteForceButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: MetricSize.changeStatusButtonTopAnchorConstraint),
            startBruteForceButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            startBruteForceButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
    }
}
  
// MARK: - MetricSize
struct MetricSize {
    static let stackViewTopAndLeadingAnchor: CGFloat = 10
    static let stackViewTrailingAndBottomAnchor: CGFloat = -10

    static let activityIndicatorTopAnchorConstraint: CGFloat = 350
    static let activityIndicatorLeadingAnchorConstraint: CGFloat = 95
    static let activityIndicatorTrailingAnchorConstraint: CGFloat = -95

    static let infoLabelNumberOfLines: Int = 3
    static let infoLabelFont: CGFloat = 15
    static let infoLabelTopAnchorConstraint: CGFloat = 10

    static let textFieldLayerCornerRadius: CGFloat = 6
    static let textFieldTopAnchorConstraint: CGFloat = 50
    static let textFieldLeadingAnchorConstraint: CGFloat = 95
    static let textFieldTrailingAnchorConstraint: CGFloat = -95

    static let buttonColorReplacementLayerCornerRadius: CGFloat = 5
    static let buttonColorReplacementTopAnchorConstraint: CGFloat = 10

    static let changeStatusButtonCornerRadius: CGFloat = 5
    static let changeStatusButtonTopAnchorConstraint: CGFloat = 10
}
