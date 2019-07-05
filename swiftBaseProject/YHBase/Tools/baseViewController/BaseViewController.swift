//
//  BaseViewController.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit
//import BaseViewControllerProtocol



class BaseViewController: UIViewController {

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MAIN_WHITE_COLOR
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 232.0/255, green: 55.0/255, blue: 64.0/255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:""), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.shadowImage = YHUtil.createImageFrom(Color: UIColor.clear)
    }
    
    func setNavigation(Title title:String){
        self.navigationItem.title = title
    }
    

}
