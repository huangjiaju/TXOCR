//
//  LSNetErrorHandle.swift
//  Loan
//
//  Created by lhs7248 on 2017/12/20.
//  Copyright © 2017年 XYB. All rights reserved.
//

import Foundation

let netErrorMessage = "您的网络不是很给力，请您稍后再试"

class LSNetErrorHandle: NSObject {
    
    
    class func handle(_ error:LSError,_ DefaultHander : @escaping (_ error : Error)->()) {
        
        if error.message == "失败" {
            
        }
        

        
    }
    
    
    
    
    
}
