//
//  ResponseItem.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class ResponseItem: Serializable{
    // 0未知 1成功 2失败 3完成 4取消
    var code:Int = 0
    var msg:String = ""
    var data:AnyObject?
}
