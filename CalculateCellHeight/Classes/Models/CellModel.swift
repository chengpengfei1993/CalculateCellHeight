//
//  CellModel.swift
//  CalculateCellHeight
//
//  Created by Chan on 16/9/27.
//  Copyright © 2016年 Chan. All rights reserved.
//

import UIKit

class CellModel: NSObject {
    var title       : String?
    var desc        : String?
    var time        : String?
    var imageUrl    : String?
    var cellHeight  = CGFloat(0)
    override init() {
     super.init()
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    init(dic :[String:Any]) {
        super.init()
        setValuesForKeys(dic)
    }
}
