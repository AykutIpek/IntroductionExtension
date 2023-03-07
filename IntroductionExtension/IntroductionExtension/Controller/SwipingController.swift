//
//  SwipingController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 5.03.2023.
//

import UIKit

final class SwipingController: UICollectionViewController {
    // MARK: - UIElements
    private var stackView = UIStackView()
    private static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    // MARK: - Properties
    private let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer!", bodyTextUnderLine: "We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the saving immediately when we announce our website", bodyTextUnderLine: "Make sure to also give us any feedback you have"),
        Page(imageName: "leaf_third", headerText: "VIP members sprecial service", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer!", bodyTextUnderLine: "We hope to see you in our stores soon.")
    ]
    private lazy var previousButton : UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.backgroundColor = .systemBackground
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.addTarget(self, action: #selector(handlePreviousPage), for: .touchUpInside)
        return button
    }()
    private lazy var nextButton : UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(SwipingController.mainPink, for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNextPage), for: .touchUpInside)
        return button
    }()
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = SwipingController.mainPink
        return pageControl
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - Selector
extension SwipingController{
    @objc private func handleNextPage(_ sender: UIButton){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc private func handlePreviousPage(_ sender: UIButton){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
        
        stackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    private func layout(){
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0{
                self.collectionView.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
}
