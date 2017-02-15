//
//  JShare.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JShare: Deserializable {
    var visible:Int = 0
    var title:String?
    var content:String?
    var moment:String?
    var sina:String?
    var linkUrl:String?
    var imgUrl:String?
    var hide:Array<String>?
    
    required init(data: JSONDictionary) {
        self.visible        <-- data["visible"]
        self.title        <-- data["title"]
        self.content        <-- data["content"]
        self.moment        <-- data["moment"]
        self.sina        <-- data["sina"]
        self.linkUrl        <-- data["linkUrl"]
        self.imgUrl        <-- data["imgUrl"]
        self.hide        <-- data["hide"]
    }
    
    func getVisible() -> Bool{
        return visible == 1;
    }
}