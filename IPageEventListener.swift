//
//  IPageEventListener.swift
//  JSBridge
//
//  Created by xujian on 16/4/14.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

protocol IPageEventListener {
    func onPageStartEvent(data:AnyObject)
    
    func onPageCompletedEvent()
    
    func onScrollChanged(l:Int, t:Int, oldl:Int, oldt:Int)
}
