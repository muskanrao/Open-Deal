//
//  MainViewController.swift
//  openDeal
//
//  Created by Muskan on 18/02/23.
//

import UIKit

class MainViewController: UIViewController {
    

    var imageList : [imageModel] = []
    let leftAndRightPaddings: CGFloat = 80.0
    
    
    let numberOfItemsPerRow : CGFloat = 1.0
    let screenSize: CGRect = UIScreen.main.bounds
    
    private let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
   /* private let productCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()*/
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "launchScreen")
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false;
        return image
    }()
    
    private let pageControl : UIPageControl = {
        let pages = UIPageControl()
        pages.currentPage = 0
        pages.numberOfPages = 3
        pages.pageIndicatorTintColor = .gray
        pages.currentPageIndicatorTintColor = .black
        pages.translatesAutoresizingMaskIntoConstraints = false
        return pages
    }()
    var shoppingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Shop"
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var onlineShopButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("ONLINE SHOP", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font  = .boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    var offlineShopButton : UIButton =  {
        let button = UIButton(type: .system)
        button.setTitle("OFFLINE SHOP", for: .normal)
      
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    var downLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Times New Roman", size: 55)
        label.font = .boldSystemFont(ofSize: 55)
        label.textColor = .gray
        label.text = "OPEN DEAL"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelString = [
        "No need for searching anymore, we are here with best places and deals.",
        "We helps you to provide best gifts for your friends and family.",
        "Search nearby shops and use our best services."
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(pageControl)
        view.addSubview(collectionView)
       //view.addSubview(productCollectionView)
        view.addSubview(shoppingLabel)
        pageControl.isUserInteractionEnabled = false
        onlineShopButton.addTarget(self, action: #selector(onlinePressed), for: .touchUpInside)
        offlineShopButton.addTarget(self, action: #selector(offlinePressed), for: .touchUpInside)
     
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell().identifier)
        if let layout  = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        onlineShopButton.isUserInteractionEnabled = true
        offlineShopButton.isUserInteractionEnabled = true
        imageList = [
            .init(image: "deal"),//, label: "No need for searching anymore, we are here with best places and deals."),
            .init(image: "gifts"),//, label: "We helps you to provide best gifts for your friends and family."),
            .init(image: "sale")//, label: "Search nearby shops and use our best services.")
        ]

        self.layout()
    }
   
    @objc func onlinePressed() {
        navigationController?.pushViewController(HomeShopViewController(), animated: true)
    }
    @objc func offlinePressed(){
        navigationController?.pushViewController(LocationViewController(), animated: true)
    }
    
    
    
    private func labelAnimation(){
        
    }
    
    private func layout() {
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 20).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 130).isActive = true
        
        view.addSubview(downLabel)
        downLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 40).isActive = true
        downLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        downLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        view.addSubview(shoppingLabel)
        shoppingLabel.topAnchor.constraint(equalTo: downLabel.bottomAnchor, constant: 30).isActive = true
        shoppingLabel.leadingAnchor.constraint(equalTo: downLabel.leadingAnchor).isActive = true
        shoppingLabel.trailingAnchor.constraint(equalTo:  downLabel.trailingAnchor).isActive = true
        shoppingLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [onlineShopButton, offlineShopButton])
        view.addSubview(stackView)
        stackView.addSubview(onlineShopButton)
        stackView.addSubview(offlineShopButton)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleToFill
        stackView.topAnchor.constraint(equalTo: shoppingLabel.bottomAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: downLabel.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: downLabel.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
      

    }

}


//MARK: -CollectionView Delegate

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(imageList.count)
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell().identifier, for: indexPath) as! MainCollectionViewCell
        cell.assignValue(value: imageList[indexPath.row])
        cell.contentMode = .scaleAspectFill
        print(1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            let width = 400;
            return CGSize(width: width, height: 200)
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
}

struct imageModel {
    var image : String
}
