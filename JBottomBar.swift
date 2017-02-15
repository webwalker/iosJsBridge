//
//  JBottomBar.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JBottomBar:Deserializable {
    var visible:Int = 1
    var type:Int = 0 //默认为0无底部栏，1专题, 2笔记
    var shareIcon:JShare?
    
    required init(data: JSONDictionary) {
        self.visible        <-- data["visible"]
        self.type        <-- data["type"]
        self.shareIcon        <-- data["shareIcon"]
    }
    
    func getVisible() -> Bool{
        return visible == 1
    }
}