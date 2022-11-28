//
//  AppRouter.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let vc = QuoteListBuilder.make()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
