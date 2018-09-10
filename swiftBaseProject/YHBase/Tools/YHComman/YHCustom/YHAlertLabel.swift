//
//  YHAlertLabel.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit

class YHAlertLabel: UIView {

    convenience init(Frame frame:CGRect, Text text:String, DismissTime dismissTime:Int){
        self.init(frame: frame)
        
        let label = YHUtil.createLabelWith(Text: text, Frame: frame, TextColor: UIColor.white, Font: 14, TextAligtment: .center)
        label.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.isHidden = true
        self.addSubview(label)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(dismissTime)), execute: {
            self.removeFromSuperview()
        })
    }

}
