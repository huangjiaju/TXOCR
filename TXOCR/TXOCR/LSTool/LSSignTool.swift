//
//  LSTool.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/5.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import Foundation
class LSSignTool: NSObject {
    
    
    ///获取验签
    class  func getReqSign(param:[String:Any],_ appkey:String) -> String {
        
        let keysArray = Array(param.keys)
        
        let sortArray =  keysArray.sorted { $0 < $1}
        
        var keyValueStr = ""
        
        for item  in sortArray {
            
            if((param[item]) != nil){
                let  itemStr = param[item]!
                if itemStr is String{
                    let encodUrlStr = LSMD5String.encodeUrlString(itemStr as! String)
                    keyValueStr = keyValueStr + "\(item)=\(encodUrlStr!)&"
                }else{
                    keyValueStr = keyValueStr + "\(item)=\(itemStr)&"
                }
                
            }
        }
        
        
        let MD5String  = keyValueStr + "app_key=\(appkey)"
        
        let signStr =  LSMD5String.md5Encrypt(MD5String)
        
        
        return signStr!
    }
    
}
