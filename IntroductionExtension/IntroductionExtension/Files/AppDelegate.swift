//
//  AppDelegate.swift
//  IntroductionExtension
//
//  Created by aykut ipek on 4.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        window = UIWindow()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = swipingController
        window?.makeKeyAndVisible()
        return true
    }
}

