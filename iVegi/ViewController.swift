//
//  ViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 05.02.2022.
//

import UIKit

class ViewController: UIViewController {

    private var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Lets start", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(startButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startButton.center = view.center
    }

    
    @objc func didTapButton() {
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: RecipeVC())
        let vc3 = UINavigationController(rootViewController: ColoriesVC())
        let vc4 = UINavigationController(rootViewController: CafeVC())
        let vc5 = UINavigationController(rootViewController: SettingsVC())
        
        vc1.title = "Home"
        vc2.title = "Recipe"
        vc3.title = "Colories"
        vc4.title = "Cafe"
        vc5.title = "Settings"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house", "book", "scale.3d", "cup.and.saucer.fill", "gear"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName:  images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        tabBarVC.tabBar.tintColor = .systemGreen
        tabBarVC.tabBar.backgroundColor = UIColor(displayP3Red: 11, green: 5, blue: 3, alpha: 0.7)
    }
    
}

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Home"
    }
}

class RecipeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Recipe"
    }
}

class ColoriesVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Colories"
    }
}

class CafeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Cafe"
    }
}

class SettingsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Settings"
    }
}

