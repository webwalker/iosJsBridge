//
//  JTitleBar.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JTitleBar: Deserializable {
    var visible:Int = 1
    var title:String = ""
    var backIcon:BackIconEntity?
    var shareIcon:JShare?
    var msgIcon:Int = 1
    var moreIcon:Array<MoreIconEntity>?
    var diaryIcon:Int = 0
    var ygjIcon:Int = 0
    var theme:Int = 0
    
    required init(data: JSONDictionary) {
        self.visible     <-- data["visible"]
        self.title     <-- data["title"]
        self.backIcon     <-- data["backIcon"]
        self.shareIcon     <-- data["shareIcon"]
        self.msgIcon     <-- data["msgIcon"]
        self.moreIcon     <-- data["moreIcon"]
        self.diaryIcon     <-- data["diaryIcon"]
        self.ygjIcon     <-- data["ygjIcon"]
        self.theme         <-- data["theme"]
    }
    
    func getVisible() ->Bool {
        return visible == 1
    }
    
    func getMsgIcon() ->Bool {
        return msgIcon == 1;
    }
    
    func getDiaryIcon() ->Bool {
        return diaryIcon == 1;
    }
    
    func getYgjIcon() ->Bool {
        return ygjIcon == 1;
    }
    
    class BackIconEntity: Deserializable {
        var visible:Int = 0
        var onClick:String?
        
        required init(data: JSONDictionary) {
            self.visible     <-- data["visible"]
            self.onClick     <-- data["onClick"]
        }
        
        func getVisible() ->Bool {
            return visible == 1;
        }
    }
    
    class MoreIconEntity: Deserializable {
        var title:String?
        var url:String?
        
        required init(data: JSONDictionary) {
            self.title     <-- data["title"]
            self.url     <-- data["url"]
        }
    }
}