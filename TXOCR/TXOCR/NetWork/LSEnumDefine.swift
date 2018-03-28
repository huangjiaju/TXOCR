//
//  LSEnumDefine.swift
//  Loan
//
//  Created by lhs7248 on 2017/12/22.
//  Copyright © 2017年 XYB. All rights reserved.
//

import UIKit
enum LSStatus : Int {
    case code = 1 //需要图形验证码
    case tlFail = 4 //通联校验人卡不一致
    case directlySkip = 5 // 小贷用户鉴权后直接跳转
    case none = -1 //错误处理
}

enum LSDynamicCodeType : Int {
    case modifyRegister      = 1 //注册
    case modifyLoginPassword = 2 //修改登录密码
    case modifyDealPassword  = 3 //修改提现密码
    case bindBankCard        = 6 //绑定银行卡校验预留手机号
    case modifyPhone         = 7 //修改手机号获取原手机号验证码
}
