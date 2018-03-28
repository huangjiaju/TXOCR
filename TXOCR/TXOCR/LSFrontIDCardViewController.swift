//
//  LSFrontIDCardViewController.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/5.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import UIKit

class LSFrontIDCardViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    var idCardModel:LSIDCardModel? // 身份证的模型
    @IBOutlet weak var idCardFrontImage: UIImageView!
    
    @IBOutlet weak var idCardBackImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var idCardLabel: UILabel!
    class func instance() -> LSFrontIDCardViewController {
        
        return UIStoryboard(name: "LSFrontIDCardViewController", bundle:nil).instantiateInitialViewController() as! LSFrontIDCardViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setIDCardResutl(idCardModel!)
    }
    
    ///设置模型
    func setIDCardResutl(_ idCardModel:LSIDCardModel) -> Void {
        
        if idCardModel.frontimage != nil{
            
            let frontImageData =  Data(base64Encoded: idCardModel.frontimage!, options:.ignoreUnknownCharacters)!
            resultImageView.image = UIImage(data: frontImageData)
            
            nameLabel.text = idCardModel.name
            
            sexLabel.text = idCardModel.sex
            nationLabel.text = idCardModel.nation
            
            birthLabel.text = idCardModel.birth
            
            addressLabel.text = idCardModel.address
            idCardLabel.text = idCardModel.id
            
            
        }
        
//        if idCardModel.backimage != nil{
//            let backImageData =  Data(base64Encoded: idCardModel.backimage!, options: .ignoreUnknownCharacters)!
//            idCardFrontImage.image = UIImage(data: backImageData)
//        }
        
        
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}


extension String{
    
    ///utf8 的data数据
    var utf8Data:Data{
        
        return data(using: .utf8)!
    }
    
    ///base64  的编码操作
    
    /// 字符串进行base64处理
    /// - Parameter str:传入的字符串
    /// - Returns: 返回base 64 之后的字符串
    
    func base64Str(str:String) -> String {
        
        let data = str.data(using: .utf8)!
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    
    
    /// data的数据的base64操作
    /// - Parameter data: 需要进行base64 的数据
    /// - Returns: 返回base64之后的字符串
    func base64Str(data:Data) -> String {
        
        return data.base64EncodedString(options:Data.Base64EncodingOptions(rawValue: 0))
    }
    
    
    /// base64 字符 转字符串 的解码操作
    /// - Parameter base64Str: 需要解码的字符串
    /// - Returns: 返回解码过的字符串
    func base64Decode(base64Str:String) -> String {
        let data =  Data(base64Encoded: base64Str, options: .ignoreUnknownCharacters)
        
        return String(data: data!, encoding: .utf8)!
    }
    
    /// base64 字符串 转 data数据的操作
    /// - Parameter base64Str: 需要解码的字符串
    /// - Returns: 返回解码过的data数据
    func base64Decode(base64Str:String) -> Data {
        return Data(base64Encoded: base64Str, options: .ignoreUnknownCharacters)!
    }
}
