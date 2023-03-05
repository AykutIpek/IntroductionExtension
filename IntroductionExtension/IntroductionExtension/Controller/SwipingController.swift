//
//  SwipingController.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 5.03.2023.
//

import UIKit

final class SwipingController: UICollectionViewController {
    // MARK: - Properties
    
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
        collectionView.backgroundColor = .green
    }
    private func layout(){
        
    }
}

