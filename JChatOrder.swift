//
//  JChatOrder.swift
//  JSBridge
//
//  Created by xujian on 16/4/13.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class JChatOrder: Deserializable {
    var ActuallyPrice:Int = 0
    var AddTime:AnyObject?
    var Catalog:String?
    var DistributionType:Int = 0
    var DistributionTypeText:String?
    var Earnest:Int = 0
    var FreeShipping:Bool = false
    var Freight:Int = 0
    var IsActivityProduct:Bool = false
    var IsMultiProduct:Bool = false
    var LeaveWord:AnyObject?
    var LogisticsNewStatus:AnyObject?
    var OrderId:String?
    var OrderTime:AnyObject?
    var OrderTotalPrice:Int = 0
    var PaidAmount:Int = 0
    var PaidInFull:Bool = false
    var Platform:Int = 0
    var Price:Int = 0
    var PriceType:Int = 0
    var ProductCount:Int = 0
    var ProductDes:String?
    var ProductId:AnyObject?
    var ProductPic:String?
    var ProductsNum:Int = 0
    var Remarks:AnyObject?
    var SellerId:String?
    var TailAmount:Int = 0
    var TariffType:Int = 0
    var TotalPrice:Int = 0
    var TradingStatus:Int = 0
    var TradingStatusText:String?
    
    required init(data: JSONDictionary) {
        self.ActuallyPrice          <-- data["ActuallyPrice"]
        self.AddTime                <-- data["AddTime"]
        self.Catalog                <-- data["Catalog"]
        self.DistributionType       <-- data["DistributionType"]
        self.DistributionTypeText   <-- data["DistributionTypeText"]
        self.Earnest                <-- data["Earnest"]
        self.FreeShipping           <-- data["FreeShipping"]
        self.Freight                <-- data["Freight"]
        self.IsActivityProduct      <-- data["IsActivityProduct"]
        self.IsMultiProduct         <-- data["IsMultiProduct"]
        self.LeaveWord              <-- data["LeaveWord"]
        self.LogisticsNewStatus     <-- data["LogisticsNewStatus"]
        self.OrderId                <-- data["OrderId"]
        self.OrderTime              <-- data["OrderTime"]
        self.OrderTotalPrice        <-- data["OrderTotalPrice"]
        self.PaidAmount             <-- data["PaidAmount"]
        self.PaidInFull             <-- data["PaidInFull"]
        self.Platform               <-- data["Platform"]
        self.Price                  <-- data["Price"]
        self.PriceType              <-- data["PriceType"]
        self.ProductCount           <-- data["ProductCount"]
        self.ProductDes             <-- data["ProductDes"]
        self.ProductId              <-- data["ProductId"]
        self.ProductPic             <-- data["ProductPic"]
        self.ProductsNum            <-- data["ProductsNum"]
        self.Remarks                <-- data["Remarks"]
        self.SellerId               <-- data["SellerId"]
        self.TailAmount             <-- data["TailAmount"]
        self.TariffType             <-- data["TariffType"]
        self.TotalPrice             <-- data["TotalPrice"]
        self.TradingStatus          <-- data["TradingStatus"]
        self.TradingStatusText      <-- data["TradingStatusText"]
    }
}








