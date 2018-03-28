//
//  LSNetWorkStatusManager.swift
//  Loan
//
//  Created by lhs7248 on 2017/12/29.
//  Copyright © 2017年 XYB. All rights reserved.
//

import Foundation
import Alamofire

enum LSNetworkStatus : Int {
    case unknown = 1 //未知网络
    case notReachable = 2 // 不可链接
    case ethernetOrWiFi = 3 //以太网或者wifi
    case wwan = 4 //数据网络
}


class LSNetWorkStateManager : NSObject {
    
    
    let reachabilityManager : NetworkReachabilityManager = NetworkReachabilityManager()!

    var networkStatus : LSNetworkStatus = LSNetworkStatus.notReachable
    
    
    @objc static let sharedInstance : LSNetWorkStateManager = {
        
        let instace = LSNetWorkStateManager()
        
        instace.reachabilityManager.listener = { status in
            
            switch status {
            case .notReachable:
                instace.networkStatus = .notReachable
            case .unknown:
                instace.networkStatus = .unknown
            case .reachable(.ethernetOrWiFi):
                instace.networkStatus = .ethernetOrWiFi
            case .reachable(.wwan):
                instace.networkStatus = .wwan
            }
        }
        return instace
    }()
    
   @objc func startListening() -> Void {
        reachabilityManager.startListening()
    }

}
