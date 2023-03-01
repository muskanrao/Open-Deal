//
//  CustomerLoginViewController.swift
//  openDeal
//
//  Created by Muskan on 16/02/23.
//

import UIKit

class CustomerLoginViewController: UIViewController {

    
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
    
    var loginButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    var otpButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("OTP", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var signupButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var profile : UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profile)
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        navigationController?.navigationBar.barStyle  = UIBarStyle.black
        navigationController!.navigationBar.tintColor = UIColor.black
        signupButton.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        view.addSubview(loginButton)
        self.layoutset()
    }
    
    @objc func loginPressed() {
        navigationController?.pushViewController(TabViewController(), animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func signupPressed(){
        navigationController?.pushViewController(CRegisterViewController(), animated: true)
    }
    
    private func layoutset() {
        
        profile.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
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
        
        stackView.topAnchor.constraint(equalTo: profile.bottomAnchor,constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        let buttonView = UIStackView(arrangedSubviews: [otpButton, signupButton])
        view.addSubview(buttonView)
        buttonView.addSubview(signupButton)
        buttonView.addSubview(otpButton)
        buttonView.distribution = .equalSpacing
        buttonView.axis = .horizontal
        buttonView.spacing = 20
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        //layout
        buttonView.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 30).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        
        
    }
    

}
