//
//  YHNavigationController.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit

class YHNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem().barButtonItemWith(Target: self, Action: #selector(pressBack), NormalImage: UIImage(named:"")!, HighLightedImage: UIImage(named:"")!)
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    @objc func pressBack(){
        self.popViewController(animated: true)
    }
    

}
