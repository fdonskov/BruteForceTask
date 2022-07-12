//
//  View.swift
//  BruteForceTask
//
//  Created by Федор Донсков on 12.07.2022.
//

import UIKit

class BruteForceView: UIView {
    
    // MARK: - Properties
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
        textField.backgroundColor = .systemGray
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
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonResetBruteForce: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.layer.cornerRadius = MetricSize.changeStatusButtonCornerRadius
        button.backgroundColor = .blue
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
        addSubview(labelPassword)
        addSubview(activityIndicator)
        addSubview(textFieldPassword)
        addSubview(buttonChangingBackgroundColor)
        addSubview(buttonStartBruteForce)
        addSubview(buttonResetBruteForce)
        
        createConstraints()
    }
    
    // MARK: - Create Constraints Method
    func createConstraints() {
        constraintLabelPassword()
        constraintActivityIndicator()
        constraintTextFieldPassword()
        constraintButtonChangingBackgroundColor()
        constraintButtonStartBruteForce()
        constraintButtonResetBruteForce()
    }
    
    // MARK: - Create Constraints Elements
    private func constraintLabelPassword() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func constraintActivityIndicator() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func constraintTextFieldPassword() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func constraintButtonChangingBackgroundColor() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func constraintButtonStartBruteForce() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func constraintButtonResetBruteForce() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
  
// MARK: - MetricSize
struct MetricSize {
    static let stackViewTopAndLeadingAnchor: CGFloat = 8
    static let stackViewTrailingAndBottomAnchor: CGFloat = -8

    static let activityIndicatorTopAnchorConstraint: CGFloat = 200
    static let activityIndicatorLeadingAnchorConstraint: CGFloat = 100
    static let activityIndicatorTrailingAnchorConstraint: CGFloat = -100

    static let infoLabelNumberOfLines: Int = 3
    static let infoLabelFont: CGFloat = 15
    static let infoLabelTopAnchorConstraint: CGFloat = 10

    static let textFieldLayerCornerRadius: CGFloat = 6
    static let textFieldTopAnchorConstraint: CGFloat = 50
    static let textFieldLeadingAnchorConstraint: CGFloat = 100
    static let textFieldTrailingAnchorConstraint: CGFloat = -100

    static let buttonColorReplacementLayerCornerRadius: CGFloat = 5
    static let buttonColorReplacementTopAnchorConstraint: CGFloat = 10

    static let changeStatusButtonCornerRadius: CGFloat = 5
    static let changeStatusButtonTopAnchorConstraint: CGFloat = 10
}
