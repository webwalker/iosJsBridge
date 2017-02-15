//
//  Extensions.swift
//  JSBridge
//
//  Created by xujian on 16/4/25.
//  Copyright © 2016年 ymatou. All rights reserved.
//

import Foundation

extension Array{
    func each(f:(Element) -> ()) {
        for i in self {
            f(i)
        }
    }
    
    func remove(f: (Element) -> Bool) -> [Element] {
        var array = [Element]()
        for x in self{
            let t = x as Element
            if f(t) == false {
                array.append(t)
            }
        }
        return array
    }
}