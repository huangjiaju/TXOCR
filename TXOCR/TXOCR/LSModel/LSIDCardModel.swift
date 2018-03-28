//
//  LSIDCardModel.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/2.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import ObjectMapper
import UIKit

//
//    ret    是    int    返回码； 0表示成功，非0表示出错
//    msg    是    string    返回信息；ret非0时表示出错时错误原因
//    data    是    object    返回数据；ret为0时有意义
//    + name    是    string    证件姓名
//    + sex    是    string    性别
//    + nation    是    string    民族
//    + birth    是    string    出生日期
//    + address    是    string    地址
//    + id    是    string    身份证号
//    + frontimage    是    string    OCR识别的身份证正面base64编码照片
//    + valid_date    是    string    证件的有效期
//    + authority    是    string    发证机关
//    + backimage    是    string    OCR识别的证件身份证反面base64编码照片


/// 查询订单和生成订单的接口
class LSIDCardModel: Mappable {
    
    var name:String? = "" // 行动码
    var sex:String? = "" // 行动码
    var nation:String? = "" //手机号
    var birth:String? = "" // 关系
    
    var address:String? = "" // 行动码
    var id:String? = "" //手机号
    var frontimage:String? = "" // 关系
    var valid_date:String? = "" // 行动码
    var authority:String? = "" //手机号
    var backimage:String? = "" // 关系
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        name                <-      map["name"]
        sex                <-      map["sex"]
        nation                <-      map["nation"]
        birth                <-      map["birth"]
        address                <-      map["address"]
        id                <-      map["id"]
        frontimage                <-      map["frontimage"]
        valid_date                <-      map["valid_date"]
        authority                <-      map["authority"]
        backimage                <-      map["backimage"]
    }
    
    
}
