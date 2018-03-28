//
//  LSNetWork.swift
//  Loan
//
//  Created by lhs7248 on 2017/11/16.
//  Copyright © 2017年 xyb. All rights reserved.
//


import UIKit
import Alamofire

import ObjectMapper
//import SVProgressHUD

class LSNetwork: NSObject {
    
    // 创建单例
    static let sharedInstance : LSNetwork = {
        let networkClinet = LSNetwork()
        return networkClinet
    }()
    
    let baseUrl : String = bl_base_url
    
}


extension LSNetwork {
    
    /// 自定制的sessionManager，添加httpHeader
    static let sharedSessionManager : SessionManager = {
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        
        
//        let serverTrustPolicies: [String: ServerTrustPolicy] = [
//            "www.51xyb.cn": .pinCertificates(
//                certificates: ServerTrustPolicy.certificates(),
//                validateCertificateChain: false,
//                validateHost: true
//            )
//        ]
//        let policyManager = ServerTrustPolicyManager(policies: serverTrustPolicies)
        
        let sessionManager:SessionManager = Alamofire.SessionManager(configuration: configuration)
        
        return sessionManager
    }()
    
    /// 具体的request请求
    fileprivate func request(urlString : String,method: HTTPMethod = .get,
                             parameters: Parameters? = nil,encodType: ParameterEncoding = URLEncoding.default,
                             success:@escaping (_ responseObject : AnyObject?)->(),
                             failture : @escaping (_ error : Error)->()) {
        
        let requestUrl = self.baseUrl + urlString
        

        LSNetwork.sharedSessionManager.request(requestUrl,method: method,parameters: parameters,encoding:encodType)
            .validate(contentType: ["application/json","text/html"])
            .responseJSON
            {response in
                switch response.result {
                case .success:
                    if let value = response.result.value as? [String : Any] {
                        
                        if let lsResult = Mapper<LSResponse>().map(JSON: value) {
                            
                            if lsResult.ret == 0{
                                success(lsResult.data)
                            }else{
                                let error = LSError()
                                error.errCode = lsResult.ret
                                error.message = lsResult.msg
                                LSNetErrorHandle.handle(error, failture)
                            }
                        }
                    }
                case .failure(let error):
                    debugPrint(error)
                    failture(error)
                }
        }
    }
    
}

extension LSNetwork {
    
    /// 发送GET请求
    ///
    /// - Parameters:
    ///   - urlString: 请求url地址
    ///   - params: 请求参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    func getRequest(urlString : String, params : Parameters? = nil, success:@escaping (_ responseObject : AnyObject?)->(), failture : @escaping (_ error : Error)->()) {
        
        self.request(urlString: urlString, method:.get, parameters: params, success: success, failture: failture)
    }
    
    
    /// 发送POST请求
    ///
    /// - Parameters:
    ///   - urlString: 请求url地址
    ///   - params: 请求参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    func postRequest(urlString : String, params : Parameters? = nil, success:@escaping (_ responseObject : AnyObject?)->(), failture : @escaping (_ error : Error)->()) {
        
        self.request(urlString: urlString, method:.post, parameters: params, success: success, failture: failture)
    }
    
}

// MARK: - 请求JSON 格式化
extension LSNetwork{
    
    //encoding: JSONEncoding.default
    
    func postJsonRequest(urlString : String, params : Parameters? = nil, success:@escaping (_ responseObject : AnyObject?)->(), failture : @escaping (_ error : Error)->()) {
        
        self.request(urlString: urlString, method:.post, parameters: params,encodType:JSONEncoding.default , success: success, failture: failture)
    }
}


// MARK: - 上传图片和视频
extension LSNetwork{
    
    func uploadImageData(urlString : String, params:[String: Any]?=nil , dataParams: [LSUpload]? = nil,progressB:((_ progress:Double )->())?=nil, success:@escaping (_ responseObject : [String : Any]?)->(), failture : @escaping (_ error : Error)->()) {
        
        let requestUrl = self.baseUrl + urlString
        
        var defaultHeaders : [String : String] = [:]

        
        LSNetwork.sharedSessionManager.upload(
            multipartFormData: { multipartFormData in
                if (params != nil) {
                    
                    for (key, value) in params! {
                        multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
                if (dataParams?.count)! > 0{
                    for upload in dataParams!{
                        multipartFormData.append(upload.data!, withName: upload.name!, fileName: upload.fileName!, mimeType: upload.type!)
                    }
                }
        },
            to:requestUrl, headers : defaultHeaders,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(queue:DispatchQueue.main, closure: { (progress) in
                        if progressB != nil {
                            progressB!(progress.fractionCompleted)
                        }
                    })
                    
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String : Any] {
                            
                            if let lsResult = Mapper<LSResponse>().map(JSON: value) {
                                
                                if lsResult.ret == 1{
                                    
                                    success(lsResult.data as? [String : Any])
                                }else{
                                    
                                }
                                
//                                if blResult.error == nil && blResult.result != nil {
////
////                                    // 请求正常返回
//                                    success(blResult.result as! [String : Any])
//                                }else{
//                                    // 在此处进行全局的错误处理
//                                    if let _ = blResult.error {
//                                        BLNetworkErrorHandler.handle(error : blResult.error!)
//                                    }
//                                }
                            }
                            
                        }else if response.error != nil {
//                            SVProgressHUD.BLDismiss()
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        }
        )
    }
}

struct LSUpload {
    
    var data:Data?
    var name:String?
    var fileName:String?
    var type:String?
    
    init(data:Data,name:String,fileName:String,type:String) {
        
        self.data = data
        self.name = name
        self.fileName = fileName
        self.type = type
    }
}



