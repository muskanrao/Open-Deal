//
//  CRegisterViewController.swift
//  openDeal
//
//  Created by Muskan on 16/02/23.
//

import UIKit

class CRegisterViewController: UIViewController {

    
    private var profile : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false;
        return image
    }()
    
    var emailTextfield : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 18)
    
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var passwordTextfield : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textContentType = .password
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 18)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var signupButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("REGISTER", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var otpButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OTP", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signupButton)
        view.addSubview(profile)
        view.addSubview(otpButton)
        let tap = UIGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle  = UIBarStyle.black
        navigationController!.navigationBar.tintColor = UIColor.black
        self.layoutset()
       
    }
    
    @objc func dismissKeyboard () {
        view.endEditing(true)
    }
    
    private func layoutset() {
        
        profile.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        profile.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 120).isActive = true
        profile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.addSubview(emailTextfield)
        stackView.addSubview(passwordTextfield)
        
        //layout
        
        stackView.topAnchor.constraint(equalTo: profile.topAnchor,constant: 170).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        signupButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        
         otpButton.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 30).isActive = true
         otpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        
        
       
    }
  
}
