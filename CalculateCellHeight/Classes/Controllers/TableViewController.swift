//
//  TableViewController.swift
//  CalculateCellHeight
//
//  Created by Chan on 16/9/27.
//  Copyright © 2016年 Chan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

//    lazy var dataArray = [CellModel]()
    lazy var dataArray = Array<CellModel>()
    var calculateCell = TableViewCell.createCalculateCell(maxHeight: 999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        calculateCell = TableViewCell.cell(tableView: tableView)
//        calculateCell?.isCalculateHeight = true
        self.title = "计算cell高度";
        self.tableView.tableFooterView = UIView() //去掉多余的线
        createData()
    }

    func createData() {
//        var title       : String?
//        var desc        : String?
//        var time        : String?
//        var imageUrl
        let rows = [
            [
                "title"     : "乒乓女王邓亚萍，亏损20亿不致歉，导致名誉扫地",
                "desc"      : "作为国球，乒乓球带给我们的总是荣耀，谁也赢不了，对手遇到中国球员就和游戏中碰上大魔王一样，怎么打都不行。说起中国乒乓球的大魔王，大家首先想到的不是张怡宁，更不是李晓霞、丁宁之流，而是首位大满贯获得者邓亚萍。",
                "time"      : "2016-09-27 16:44",
                "imageUrl"  : "dads"
            ],
            [
                "title"     : "一个大消息突袭楼市！",
                "desc"      : "媒体援引知情人士，上海证券交易所考虑为房地产企业发行公司债设立准入门槛并实施分类管理。准入门槛要求主体评级AA及以上的公司，同时还需满足以下条件之一",
                "time"      : "2016-09-27 19:13",
                "imageUrl"  : ""
            ],
            [
                "title"     : "乒乓女王邓亚萍，亏损20亿不致歉，导致名誉扫地",
                "desc"      : "作为国球，乒乓球带给我们的总是荣耀，谁也赢不了，对手遇到中国球员就和游戏中碰上大魔王一样，怎么打都不行。说起中国乒乓球的大魔王，大家首先想到的不是张怡宁，更不是李晓霞、丁宁之流，而是首位大满贯获得者邓亚萍。",
                "time"      : "2016-09-27 16:44",
                "imageUrl"  : "dads"
            ],
            [
                "title"     : "一个大消息突袭楼市！",
                "desc"      : "媒体援引知情人士，上海证券交易所考虑为房地产企业发行公司债设立准入门槛并实施分类管理。准入门槛要求主体评级AA及以上的公司，同时还需满足以下条件之一",
                "time"      : "2016-09-27 19:13",
                "imageUrl"  : ""
            ],
            [
                "title"     : "乒乓女王邓亚萍，亏损20亿不致歉，导致名誉扫地",
                "desc"      : "作为国球，乒乓球带给我们的总是荣耀，谁也赢不了，对手遇到中国球员就和游戏中碰上大魔王一样，怎么打都不行。说起中国乒乓球的大魔王，大家首先想到的不是张怡宁，更不是李晓霞、丁宁之流，而是首位大满贯获得者邓亚萍。",
                "time"      : "2016-09-27 16:44",
                "imageUrl"  : "dads"
            ],
            [
                "title"     : "一个大消息突袭楼市！",
                "desc"      : "媒体援引知情人士，上海证券交易所考虑为房地产企业发行公司债设立准入门槛并实施分类管理。准入门槛要求主体评级AA及以上的公司，同时还需满足以下条件之一",
                "time"      : "2016-09-27 19:13",
                "imageUrl"  : ""
            ],
            [
                "title"     : "乒乓女王邓亚萍，亏损20亿不致歉，导致名誉扫地",
                "desc"      : "作为国球，乒乓球带给我们的总是荣耀，谁也赢不了，对手遇到中国球员就和游戏中碰上大魔王一样，怎么打都不行。说起中国乒乓球的大魔王，大家首先想到的不是张怡宁，更不是李晓霞、丁宁之流，而是首位大满贯获得者邓亚萍。",
                "time"      : "2016-09-27 16:44",
                "imageUrl"  : "dads"
            ],
            [
                "title"     : "一个大消息突袭楼市！",
                "desc"      : "媒体援引知情人士，上海证券交易所考虑为房地产企业发行公司债设立准入门槛并实施分类管理。准入门槛要求主体评级AA及以上的公司，同时还需满足以下条件之一",
                "time"      : "2016-09-27 19:13",
                "imageUrl"  : ""
            ]

        ];
        
        for dic in rows {
            let news = CellModel(dic: dic)
            dataArray.append(news)
        }
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell.cell(tableView: tableView)
        if indexPath.row < dataArray.count {
           cell.news = dataArray[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < dataArray.count {
            let news = dataArray[indexPath.row]
            if news.cellHeight <= 0 {
                calculateCell.calculate(model: news)
            }
            return news.cellHeight
        }
        return 0
    }
}
