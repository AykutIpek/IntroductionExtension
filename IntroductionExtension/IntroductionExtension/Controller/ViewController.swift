//
//  ViewController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        return imageView
    }()
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.textColor = .red
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = .white
        textView.textAlignment = .center
        return textView
    }()
    private let labelFirst: UILabel = {
        let label = UILabel()
        label.text = "Deneme"
        label.textColor = .label
        return label
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
    }
    private func style(){
        view.backgroundColor = .systemBackground
    }
    private func layout(){
        view.addSubview(imageView)
        view.addSubview(descriptionTextView)
        view.addSubview(labelFirst)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
//
//        descriptionTextView.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(120).constraint.isActive = true
//            make.left.equalToSuperview().constraint.isActive = true
//            make.right.equalToSuperview().constraint.isActive = true
//            make.centerX.equalToSuperview().constraint.isActive = true
//        }
        
        labelFirst.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(120)
            make.left.equalToSuperview()
        }
    }
}

