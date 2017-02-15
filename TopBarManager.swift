//
//  TopBarManager.swift
//  JSBridge
//
//  Created by xujian on 16/5/24.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

class TopBarManager {
    
    func showDefaultTopBar(params:JTitleBar?, bridge:HandlerBridge) {
        //title
        if !params!.title.isEmpty {
            // to-do 设置标题
        }
        
        //back icon， to-do 处理返回按钮
        if let backIcon = params!.backIcon {
            if backIcon.getVisible() {
                //to-do 设置为可见
                
                if let onClick = backIcon.onClick {
                    //to-do 执行返回按钮定义的点击事件
                }
            }
            else {
                //to-do 设置为不可见
            }
        }
        //shareicon
        if let shareIcon = params!.shareIcon {
            if shareIcon.getVisible() {
                //设置分享信息
            }
        }
        //msgicon
        if params!.getMsgIcon() {
            
        }
        //moreicon
        if let moreIcon = params!.moreIcon {
            if moreIcon.count > 0 {
                
            }
        }
        //日记详情页特殊的ICON
        if params!.getDiaryIcon() {
        }
        
        //洋管家
        if params!.getYgjIcon() {
            
        }
    }
    
    func showSecondTopBar(params:JTitleBar?, bridge:HandlerBridge) {
        
    }
}