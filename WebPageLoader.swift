//
//  WebPageLoader.swift
//  用于统一管理web窗口打开
//
//  Created by xujian on 16/4/25.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class WebPageLoader {
    class func getInstance() -> WebPageLoader {
        struct Singleton {
            static let instance = WebPageLoader()
        }
        
        return Singleton.instance
    }
    
    
}