//
//  ViewController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    // MARK: - UIElements
    private static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    private var stackView = UIStackView()
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let imageContainerView: UIView = {
        let imageContainer = UIView()
        imageContainer.layer.zPosition = -1
        return imageContainer
    }()
    private let labelFirst: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [.foregroundColor: UIColor.label, .font: UIFont.boldSystemFont(ofSize: 18)])
        label.attributedText = attributedString
        // Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.
        return label
    }()
    private let attributedText: UILabel = {
        let textView = UILabel()
        let attributed = NSMutableAttributedString(string: "Are you ready for loads and loads of fun? Don't wait any longer!", attributes: [.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 13)])
        textView.attributedText = attributed
        return textView
    }()
    private let attributedTextTwo: UILabel = {
        let label = UILabel()
        let attributed = NSMutableAttributedString(string: "We hope to see you in our stores soon.", attributes: [.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 13)])
        label.attributedText = attributed
        return label
    }()
    private let previousButton : UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.backgroundColor = .systemBackground
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        return button
    }()
    private let nextButton : UIButton = {
        let button =  UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(mainPink, for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    private let blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = mainPink
        return pageControl
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Helpers
extension ViewController{
    private func setupUI(){
        style()
        layout()
        setupBottomControls()
    }
    fileprivate func setupBottomControls(){
        
    }
    private func style(){
        stackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    private func layout(){
        view.addSubview(imageView)
        view.addSubview(labelFirst)
        view.addSubview(imageContainerView)
        view.addSubview(attributedText)
        view.addSubview(attributedTextTwo)
        view.addSubview(stackView)
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(imageContainerView).multipliedBy(0.5)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        labelFirst.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(120)
            make.centerX.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        attributedText.snp.makeConstraints { make in
            make.top.equalTo(labelFirst.snp.bottom).offset(10)
            make.centerX.equalToSuperview()

        }
        attributedTextTwo.snp.makeConstraints { make in
            make.top.equalTo(attributedText.snp.bottom).offset(2)
            make.centerX.equalToSuperview()

        }
//        previousButton.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(8)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
//            make.height.equalTo(40)
//            make.width.equalTo(80)
//        }
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
