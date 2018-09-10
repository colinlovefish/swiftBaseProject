//
//  UIBarButtonItem+Extension.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    func barButtonItemWith(Target target:Any?, Action action:Selector?, NormalImage normalImage:UIImage?, HighLightedImage highLightImage:UIImage?) -> UIBarButtonItem{
        let btn = UIButton(type:.custom)
        if target != nil && action != nil {
            btn.addTarget(target, action: action!, for: .touchUpInside)
        }
        if normalImage != nil {
            btn.setBackgroundImage(normalImage, for: .normal)
        }
        if highLightImage != nil {
            btn.setBackgroundImage(highLightImage, for: .highlighted)
        }
        return UIBarButtonItem(customView: btn)
    }
    
}


