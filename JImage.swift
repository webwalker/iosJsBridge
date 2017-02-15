//
//  JImage.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JImage: Deserializable {
    var count:Int = 0
    var localId:String?
    var sizeType:Array<String>?
    var sourceType:Array<String>?
    var url:String?
    var message:String? //显示当前上传的提示, eg:正在上传第{0}图，88%
    
    required init(data: JSONDictionary) {
        self.count                  <-- data["count"]
        self.localId                <-- data["localId"]
        self.sizeType               <-- data["sizeType"]
        self.sourceType             <-- data["sourceType"]
        self.url                    <-- data["url"]
        self.message                <-- data["message"]
    }
}