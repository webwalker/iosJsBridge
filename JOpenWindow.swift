//
//  JOpenWindow.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JOpenWindow: Deserializable {
    var url:String = ""
    var winType:Int = 0 //1专题，2笔记
    var anmiType:Int = 0
    
    required init(data: JSONDictionary) {
        self.url     <-- data["url"]
        self.winType     <-- data["winType"]
        self.anmiType     <-- data["anmiType"]
    }
}