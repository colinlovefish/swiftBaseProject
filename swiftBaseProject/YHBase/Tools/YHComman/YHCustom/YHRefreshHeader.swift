//
//  YHRefreshHeader.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit
import MJRefresh

class YHRefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var idleImages = [UIImage]()
        for i in 1...60 {
            let image = UIImage(named:"reload_0\(i)")
            idleImages.append(image!)
        }
        self.setImages(idleImages, for: .idle)
        
        var refreshImages = [UIImage]()
        for i in 1...6 {
            let image = UIImage(named:"reload_refresh0\(i)")
            refreshImages.append(image!)
        }
        self.setImages(refreshImages, for: .pulling)
        
        self.setImages(refreshImages, for: .refreshing)
        
    }

}
