//
//  NavigationUtil.swift
//  SecretDiary
//
//  Created by 장서영 on 2022/06/09.
//

import UIKit

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
        
        func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
            guard let viewController = viewController else {
                return nil
            }
            
            if let navigationController = viewController as? UINavigationController {
                return navigationController
            }
            
            for childViewController in viewController.children {
                return findNavigationController(viewController: childViewController)
            }
            
            return nil
        }
    }
}


