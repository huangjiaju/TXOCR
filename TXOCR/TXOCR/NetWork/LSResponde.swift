//
//  LSResponde.swift
//  Loan
//
//  Created by lhs7248 on 2017/11/16.
//  Copyright © 2017年 xyb. All rights reserved.
//

import UIKit
import ObjectMapper

class LSResponse: Mappable {
    
    var ret:Int?
    var msg:String? = ""
    var data:AnyObject?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ret                <-      map["ret"]
        msg                <-      map["msg"]
        data                <-      map["data"]
    }
    
}


class LSError:Error {
    
    var errCode: Int? = 0
    var message: String? = ""
    
}



class LSVersionUpdataModel: Mappable {
    
    var title:String? = ""
    var message:String? = ""
    var url:String? = ""
    var currentVersion:String? = ""
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        title                <-      map["title"]
        message                <-      map["message"]
        url                <-      map["url"]
        currentVersion                <-      map["currentVersion"]
    }
    
}
