//
//  SwipingController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 5.03.2023.
//

import UIKit

final class SwipingController: UICollectionViewController {
    // MARK: - Properties
    private let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer!", bodyTextUnderLine: "We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the saving immediately when we announce our website", bodyTextUnderLine: "Make sure to also give us any feedback you have"),
        Page(imageName: "leaf_third", headerText: "VIP members sprecial service", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer!", bodyTextUnderLine: "We hope to see you in our stores soon.")
    ]
//    private let imageNames = ["bear_first","heart_second","leaf_third"]
//    private let headerStrings = ["Join us today in our fun and games!","Subscribe and get coupons on our daily events","VIP members sprecial service "]
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
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
//        cell.IntroductionLogoImageView.image = UIImage(named: page.imageName)
//        cell.labelFirst.text = page.headerText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
