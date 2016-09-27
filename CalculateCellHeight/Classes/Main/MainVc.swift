//
//  MainVc.swift
//  CalculateCellHeight
//
//  Created by Chan on 16/9/27.
//  Copyright © 2016年 Chan. All rights reserved.
//

import UIKit

class MainVc: NSObject {
    static func setRootVc(window:UIWindow!) {
        let tableVc = TableViewController(style: .plain)
        let navc = UINavigationController(rootViewController: tableVc)
        window.rootViewController = navc
    }
}
