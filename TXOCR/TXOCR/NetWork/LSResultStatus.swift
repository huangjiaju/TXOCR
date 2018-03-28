//
//  BLResultStatus.swift
//  BiweeklyLoan
//
//  Created by lhs7248 on 2017/9/5.
//  Copyright © 2017年 lhs7248. All rights reserved.
//

import Foundation
import ObjectMapper

class LSResultStatus : Mappable {
    
    //上银添加银行卡 获取手机验证码 特殊 1 成功 3 需要图形验证码  非 1 3 失败
    //借款页面获取验证码 1成功  4通联校验人卡不一致  非1、4失败
    //借还款状态查询 1 处理中 2处理失败 3处理成功
    //其余正常1 成功 非1 失败
    
//    @property(nonatomic, assign) LNStatus status;//1成功 非1失败
//    @property(nonatomic, copy) NSString *message;//弹出信息
//    @property(nonatomic, copy) NSString *url;//按钮url

    var status:Int?// 状态信息
    var message: String = ""//弹出信息
    var url: String = ""//按钮url

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status                <-      map["status"]
        message               <-     map["message"]
        url                <-      map["url"]
    }
    
}

