//
//  JChatProduct.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JChatProduct: Deserializable {
    var ProductId:Int = 0
    var Price:Int = 0
    var IsReplay:Int = 0
    var ProductDesc:String?
    var ProductPics:Array<String>?
    
    required init(data: JSONDictionary) {
        self.ProductId          <-- data["ProductId"]
        self.Price              <-- data["Price"]
        self.IsReplay           <-- data["IsReplay"]
        self.ProductDesc        <-- data["ProductDesc"]
        self.ProductPics        <-- data["ProductPics"]
    }
}