//
//  YHPictureShow.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit

class YHPictureShow: NSObject {
    static let picture = YHPictureShow()
    
    var oldFrame:CGRect?
    
    func show(ImageView imageView:UIImageView){
        let image = imageView.image
        
        let window = UIApplication.shared.keyWindow
        let backgroundView = YHUtil.createViewWith(Frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height), BackgroundColor: UIColor.black)
        backgroundView.alpha = 0
        
        oldFrame = imageView.convert(imageView.bounds, to: window)
        
        let newImageView = YHUtil.createImageViewWith(Frame: oldFrame!, ImageName: "", CornarRadius: 0)
        newImageView.image = image
        newImageView.tag = 1
        backgroundView.addSubview(newImageView)
        window?.addSubview(backgroundView)
        
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hide(Tap:))))
        
        UIView.animate(withDuration: 0.3) {
            imageView.frame = CGRect(x:0, y:(UIScreen.main.bounds.size.height-(image?.size.height)!*UIScreen.main.bounds.size.width/(image?.size.width)!)/2, width:UIScreen.main.bounds.size.width, height:(image?.size.height)!*UIScreen.main.bounds.size.width/(image?.size.width)!)
            backgroundView.alpha = 1
        }
    }
    
    @objc func hide(Tap tap:UITapGestureRecognizer){
        let backgroundView = tap.view
        let imageView = backgroundView?.viewWithTag(1) as! UIImageView
        UIView.animate(withDuration: 0.3, animations: {
            imageView.frame = self.oldFrame!
            backgroundView?.alpha = 0
        }) { (finish) in
            backgroundView?.removeFromSuperview()
        }
    }
}
