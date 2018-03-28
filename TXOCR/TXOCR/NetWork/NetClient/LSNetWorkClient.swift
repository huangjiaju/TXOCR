//
//  LSNetWorkClient.swift
//  Loan
//
//  Created by lhs7248 on 2017/11/16.
//  Copyright © 2017年 xyb. All rights reserved.
//

import UIKit
import ObjectMapper

///意见反馈的URL
let LS_IDCard_OCR = "fcgi-bin/ocr/ocr_idcardocr" //身份证OCR识别的请求

//let LS_General_OCR = "fcgi-bin/ocr/ocr_generalocr" //身份证OCR识别的请求

let LS_Image_Vision = "fcgi-bin/vision/vision_imgidentify" // 图片识别

class LSNetWorkClient: NSObject {
    
    
 
    
    /// 反馈的URL
    class func sendIDCardOCRRequst(with params:[String:Any],
                              success:@escaping (_ responseObject : LSIDCardModel)->(),
                              failture : @escaping (_ error : Error)->()) {
        
        LSNetwork.sharedInstance.postRequest(urlString: LS_IDCard_OCR, params: params, success: { (response) in
            
            if let responseModel = Mapper<LSIDCardModel>().map(JSON: response as! [String : Any]) {
                success(responseModel)
            }
        }, failture: failture)
    }
    
    /// 图片识别
    class func sendImageVisionRequst(with params:[String:Any],
                                   success:@escaping (_ responseObject : LSIDCardModel)->(),
                                   failture : @escaping (_ error : Error)->()) {
        
        LSNetwork.sharedInstance.postRequest(urlString: LS_Image_Vision, params: params, success: { (response) in
            
            if let responseModel = Mapper<LSIDCardModel>().map(JSON: response as! [String : Any]) {
                success(responseModel)
            }
        }, failture: failture)
    }
    
}




