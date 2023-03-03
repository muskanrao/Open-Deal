//
//  ViewController.swift
//  openDeal
//
//  Created by Muskan on 07/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var vendorProfile: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var customerProfile: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.backgroundColor = .black
        return image
    }()
    
    var vendorButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Vendor", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var customerButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Customer", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle  = UIBarStyle.black
        navigationController!.navigationBar.tintColor = UIColor.black
        view.backgroundColor = .white
        view.addSubview(vendorProfile)
        view.addSubview(vendorButton)
        view.addSubview(customerProfile)
        view.addSubview(customerButton)
        vendorButton.addTarget(self, action: #selector(vendLoginPressed), for: .touchUpInside)
        customerButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        self.layoutSet()
      
    }
    
    private func layoutSet(){
        
        vendorProfile.topAnchor.constraint(equalTo: view.topAnchor,constant: 170).isActive = true
        vendorProfile.heightAnchor.constraint(equalToConstant: 200).isActive = true
        vendorProfile.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20).isActive = true
        vendorProfile.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20).isActive = true
        vendorProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        vendorButton.topAnchor.constraint(equalTo: vendorProfile.bottomAnchor, constant: 10).isActive = true
        vendorButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20).isActive = true
        vendorButton.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20).isActive = true
        vendorButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        vendorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        customerProfile.topAnchor.constraint(equalTo: vendorButton.bottomAnchor,constant: 30).isActive = true
        customerProfile.heightAnchor.constraint(equalToConstant: 200).isActive = true
        customerProfile.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20).isActive = true
        customerProfile.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20).isActive = true
        customerProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        customerButton.topAnchor.constraint(equalTo: customerProfile.bottomAnchor, constant: 10).isActive = true
        customerButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20).isActive = true
        customerButton.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20).isActive = true
        customerButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        customerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc  func vendLoginPressed(){
        
        navigationController?.pushViewController(VendorLoginViewController(), animated: true)
        
       
    }
    @objc func loginPressed(){
        
        navigationController?.pushViewController(CustomerLoginViewController(), animated: true)
        
    }


}

