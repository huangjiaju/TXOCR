//
//  LSTakePicktureViewController.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/1.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import UIKit
class LSTakePicktureViewController: LSCameraViewController ,LSCameraDelegate{
    ///初始化项目
    var itemModel:LSItemCellModel? // 传入的模型信息
    
    class func instance() -> LSTakePicktureViewController {
        
        return UIStoryboard(name: "LSTakePicktureViewController", bundle:nil).instantiateInitialViewController() as! LSTakePicktureViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraDelegate = self
        
    }
    
    
    
    
    ///点击拍照
    @IBAction func takePhotoImageAction(_ sender: Any) {
        takePhoto()
    }
  

    ///发送OCR的image识别请求
    fileprivate func sendIDCardOCRRequst(_ imageData:Data) -> Void {
        let imageStr = imageData.base64EncodedString(options:Data.Base64EncodingOptions(rawValue: 0))
        let randomStr = RandomString.sharedInstance.getRandomStringOfLength(10)
        let time_stamp = Int(Date().timeIntervalSince1970)
        
        var  param = [String:Any]()
        param["app_id"] = AppId
        param["image"] = imageStr
        param["time_stamp"] = time_stamp
        param["card_type"] = 0
        param["nonce_str"] = randomStr
        param["sign"] = LSSignTool.getReqSign(param: param, AppKey)

        LSNetWorkClient.sendIDCardOCRRequst(with: param, success: { (idCardModel) in
            self.pushToResultViewController(idCardModel)
        }) { (error) in
            
        }

    }
    
    ///发送图片识别
    fileprivate func sendImageVisionRequst(_ imageData:Data) -> Void {
        let imageStr = imageData.base64EncodedString(options:Data.Base64EncodingOptions(rawValue: 0))
        let randomStr = RandomString.sharedInstance.getRandomStringOfLength(10)
        let time_stamp = Int(Date().timeIntervalSince1970)
        
        var  param = [String:Any]()
        param["app_id"] = AppId
        param["image"] = imageStr
        param["scene"] = 2 // 1 代表车辆，2 代表花朵
        param["time_stamp"] = time_stamp
        param["nonce_str"] = randomStr
        param["sign"] = LSSignTool.getReqSign(param: param, AppKey)
        
        LSNetWorkClient.sendImageVisionRequst(with: param, success: { (idCardModel) in
            self.pushToResultViewController(idCardModel)
        }) { (error) in
            
        }
        
    }

    func swiftyCam(_ swiftyCam: LSCameraViewController, didTake photo: UIImage){
        
        let imageData = UIImageJPEGRepresentation(photo, 0.8)
        
//        sendIDCardOCRRequst(imageData!)
        // 做花朵识别
        sendImageVisionRequst(imageData!)
        
    }
    
    fileprivate func pushToResultViewController(_ idCardModel:LSIDCardModel) -> Void {
        
        let frontVC = LSFrontIDCardViewController.instance()
        
        frontVC.idCardModel = idCardModel

        self.present(frontVC, animated: false, completion: nil)
    }

}

class RandomString {
    let characters = "0123456789abcdefghijklmnopqrstuvwxyz"
    
    /**
     生成随机字符串,
     
     - parameter length: 生成的字符串的长度
     
     - returns: 随机生成的字符串
     */
    func getRandomStringOfLength(_ length: Int) -> String {
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.count)))
            let characterIndex = characters.index(characters.startIndex, offsetBy: index)
            
            let indexCharacter = characters[characterIndex]
            
            
            ranStr.append(indexCharacter)
        }
        return ranStr
        
    }
    
    
    private init() {
        
    }
    static let sharedInstance = RandomString()
}

