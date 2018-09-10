//
//  YHNetworkReachability.swift
//  swiftBaseProject
//
//  Created by yinghu on 2018/9/10.
//  Copyright © 2018 yinghu. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD


class YHNetworkReachability: NSObject {
    static let reachAbility = YHNetworkReachability()
    
    var reachAble:Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        
        manager?.listener = { status in
            switch status {
            case .notReachable:
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.wwan):
                reach = true
            case .unknown:
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
            }
        }
        manager?.startListening()
        
        return reach
    }()
}
