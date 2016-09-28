//
//  Array+Extension.swift
//  CalculateCellHeight
//
//  Created by Chan on 16/9/28.
//  Copyright © 2016年 Chan. All rights reserved.
//

import Foundation
extension Array {
    func foreach(functor: (Element) -> ()) {
        for element in self {
            functor(element)
        }
    }
}
