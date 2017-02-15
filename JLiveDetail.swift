//
//  JLiveDetail.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JLiveDetail: Deserializable {
    var seller:SellerEntity?
    var activity:ActivityEntity?
    
    required init(data: JSONDictionary) {
        self.seller                  <-- data["seller"]
        self.activity                <-- data["activity"]
    }

    class SellerEntity: Deserializable {
        var Flag:String?
        var Logo:String?
        var Seller:String?
        var SellerId:String?
        
        required init(data: JSONDictionary) {
            self.Flag                  <-- data["Flag"]
            self.Logo                <-- data["Logo"]
            self.Seller                <-- data["Seller"]
            self.SellerId                <-- data["SellerId"]
        }
    }
    
    class ActivityEntity: Deserializable {
        var ActivityContent:String?
        var ActivityId:String?
        var ActivityName:String?
        var ActivityStatusText:String?
        var EndTime:String?
        var ShopAddress:String?
        var StartTime:String?
        
        required init(data: JSONDictionary) {
            self.ActivityContent                  <-- data["ActivityContent"]
            self.ActivityId                <-- data["ActivityId"]
            self.ActivityName                <-- data["ActivityName"]
            self.ActivityStatusText                <-- data["ActivityStatusText"]
            self.EndTime                <-- data["EndTime"]
            self.ShopAddress                <-- data["ShopAddress"]
            self.StartTime                <-- data["StartTime"]
        }
    }
}