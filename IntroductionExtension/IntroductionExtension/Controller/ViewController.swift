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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let labelFirst: UILabel = {
        let label = UILabel()
        label.text = "Join us today in our fun and games!"
        label.font = UIFont.systemFont(ofSize: 18)
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

    }
    private func layout(){
        view.addSubview(imageView)
        view.addSubview(labelFirst)
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        labelFirst.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(120)
            make.centerX.equalToSuperview()
        }
    }
}

