//
//  MainViewController.swift
//  Instagram
//
//  Created by Aknar Assanov on 04.03.2023.
//

import UIKit
import SnapKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomePageViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: ReelsViewController())
        let vc4 = UINavigationController(rootViewController: ShopViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc3.tabBarItem.image = UIImage(systemName: "plus.app")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc3.tabBarItem.selectedImage = UIImage(systemName: "plus.app", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc4.tabBarItem.image = UIImage(systemName: "film")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc4.tabBarItem.selectedImage = UIImage(systemName: "film.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc5.tabBarItem.image = UIImage(systemName: "person.crop.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        vc5.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
    
    
}


