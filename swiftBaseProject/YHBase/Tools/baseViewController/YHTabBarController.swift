//
//  YHTabBarController.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit
import TYAlertController

class YHTabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.addChildController(ChildController: MainViewController(), Title: "电销", DefaultImage: UIImage(named:"tabBarTask_default")!, SelectedImage: UIImage(named:"tabBarTask_selected")!)
        self.addChildController(ChildController: MainViewController(), Title: "车辆", DefaultImage: UIImage(named:"tabbarCar_default")!, SelectedImage: UIImage(named:"tabbarCar_selected")!)
        self.addChildController(ChildController: MainViewController(), Title: "我", DefaultImage: UIImage(named:"tabBarPersionalCenter_default")!, SelectedImage: UIImage(named:"tabBarPersionalCenter_selected")!)
        
        self.delegate = self
        self.tabBar.backgroundImage = YHUtil.createImageFrom(Color: UIColor.white)
    
    }
    
    func addChildController(ChildController child:UIViewController, Title title:String, DefaultImage defaultImage:UIImage, SelectedImage selectedImage:UIImage){
        child.tabBarItem = UITabBarItem(title: title, image: defaultImage.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        child.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:TABBAR_TINT_COLOR], for: .selected)
        
        let nav = YHNavigationController(rootViewController: child)
        self.addChildViewController(nav)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.title == "我的账户" {
            if !((YHUtil.GET_USER_DEFAULTS(Key: "userID") as! String).isEmpty) && !((YHUtil.GET_USER_DEFAULTS(Key: "oauth_token") as! String).isEmpty) && !((YHUtil.GET_USER_DEFAULTS(Key: "refresh_token") as! String).isEmpty) && !((YHUtil.GET_USER_DEFAULTS(Key: "isLogin") as! String).isEmpty) {
                return true
            }else{
                
                let alert:TYAlertView = TYAlertView(title: "系统提示", message: "您还没有登录,请登录!")
                alert.buttonDefaultBgColor = TINT_COLOR
                alert.add(TYAlertAction(title: "取消", style: .default, handler: { (action) in
                }))
                alert.add(TYAlertAction(title: "确定", style: .default, handler: { (action) in
//                    let loginVC  = LoginViewController()
//                    loginVC.hidesBottomBarWhenPushed = true
//                    let nav = tabBarController.selectedViewController as! UINavigationController
//                    nav.pushViewController(loginVC, animated: true)
                }))
                alert.show(in: self, preferredStyle: .alert)
                
                return false
            }
        }else{
            return true
        }
    }

}
