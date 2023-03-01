//
//  MainCollectionViewCell.swift
//  openDeal
//
//  Created by Muskan on 22/02/23.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let identifier  = String(describing: MainCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        addSubview(image)
        
       
        image.contentMode = .scaleAspectFill
        image.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image : UIImageView = {
        let image = UIImageView()
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false;
        return image
    }()
    var label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func assignValue (value: imageModel ){
        image.image  = UIImage(named: value.image)
        
    }
    
    
}
