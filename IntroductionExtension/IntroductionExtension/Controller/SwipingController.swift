//
//  SwipingController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 5.03.2023.
//

import UIKit

final class SwipingController: UICollectionViewController {
    // MARK: - Properties
    private let imageNames = ["bear_first","heart_second","leaf_third"]
    private let headerStrings = ["Join us today in our fun and games!","Subscribe and get coupons on our daily events","VIP members sprecial service "]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers
extension SwipingController{
    private func setupUI(){
        style()
        layout()
    }
    private func style(){
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    private func layout(){
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SwipingController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let imageName = imageNames[indexPath.row]
        cell.IntroductionLogoImageView.image = UIImage(named: imageName)
        cell.labelFirst.text = headerStrings[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
