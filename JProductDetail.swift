//
//  JProductDetail.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JProductDetail: Deserializable {
    var seller:SellerEntity?
    var product:ProductEntity?
    
    required init(data: JSONDictionary) {
        self.seller     <-- data["seller"]
        self.product     <-- data["product"]
    }
    
    class SellerEntity: Deserializable  {
        var Logo:String?
        var Seller:String?
        var SellerId:String?
        
        required init(data: JSONDictionary) {
            self.Logo     <-- data["Logo"]
            self.Seller     <-- data["Seller"]
            self.SellerId     <-- data["SellerId"]
        }
    }
    
    class ProductEntity: Deserializable  {
        var ProductId:String?
        
        required init(data: JSONDictionary) {
            self.ProductId     <-- data["ProductId"]
        }
    }
}