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
    
    var labelPassword: UILabel = {
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
    
    var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = MetricSize.textFieldLayerCornerRadius
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var buttonChangingBackgroundColor: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = MetricSize.buttonColorReplacementLayerCornerRadius
        button.setTitle("Сменить тему", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonStartBruteForce: UIButton = {
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
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierarchy()
    }
    
    // MARK: - SetupHierarchy
    func setupHierarchy() {
        backgroundColor = .white
        addSubview(stackView)
        
        stackView.addSubview(activityIndicator)
        stackView.addSubview(textFieldPassword)
        stackView.addSubview(labelPassword)
        stackView.addSubview(buttonStartBruteForce)
        stackView.addSubview(buttonChangingBackgroundColor)
        
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
            labelPassword.topAnchor.constraint(equalTo: buttonStartBruteForce.bottomAnchor, constant: MetricSize.infoLabelTopAnchorConstraint),
            labelPassword.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            labelPassword.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor)
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
            textFieldPassword.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: MetricSize.textFieldTopAnchorConstraint),
            textFieldPassword.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: MetricSize.textFieldLeadingAnchorConstraint),
            textFieldPassword.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: MetricSize.textFieldTrailingAnchorConstraint)
        ])
    }
    
    func constraintButtonChangingBackgroundColor() {
        NSLayoutConstraint.activate([
            buttonChangingBackgroundColor.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: MetricSize.buttonColorReplacementTopAnchorConstraint),
            buttonChangingBackgroundColor.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            buttonChangingBackgroundColor.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor)
        ])
    }
    
    func constraintButtonStartBruteForce() {
        NSLayoutConstraint.activate([
            buttonStartBruteForce.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: MetricSize.changeStatusButtonTopAnchorConstraint),
            buttonStartBruteForce.leadingAnchor.constraint(equalTo: textFieldPassword.leadingAnchor),
            buttonStartBruteForce.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor)
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
