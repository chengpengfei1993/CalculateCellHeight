//
//  TableViewCell.swift
//  CalculateCellHeight
//
//  Created by Chan on 16/9/27.
//  Copyright © 2016年 Chan. All rights reserved.
//

import UIKit
let ID = "TableViewCell"

class TableViewCell: UITableViewCell {
    var isCalculateHeight = false // 用来标记是否是计算高度的cell
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbDesc: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var conImgRight: NSLayoutConstraint!
    
    var news : CellModel? { // model
        didSet { // 这里做一些赋值和计算操作
            lbTitle.text = news?.title
            lbDesc.text = news?.desc
            lbTime.text = news?.time
            var showImg = false
            if (news?.imageUrl?.characters.count)! == 0 {
                conImgRight.constant = -80  //如果没有图片则不显示图片 -80可以理解为图片的maxX - 80 = 父试图的最右边(也就是宽度)
            }else {
                conImgRight.constant = 15
                showImg = true
            }
            layoutIfNeeded() // 当内容或者约束发生改变时会重新布局
            if isCalculateHeight == true {  // 只有需要计算高度时才执行以下代码
                var cellHeight = CGFloat(lbTime.frame.maxY + 12)
                if showImg == true {  // 如果不需要显示图片的话就不用管是图片距离底部最近还是时间距离底部最近了
                    if imgCover.frame.maxY > lbTime.frame.maxY {
                        cellHeight = CGFloat(imgCover.frame.maxY + 12)
                    }
                }
                news?.cellHeight = cellHeight
            }
        }
    }
    func calculate(model:CellModel){
        self.news = model
    }
    static func createCalculateCell(maxHeight:CGFloat) -> TableViewCell{
        let cell = TableViewCell.createCell()
        cell.isCalculateHeight = true // 这里要标记为true
        var newFrame = cell.frame
        newFrame.size.width = UIScreen.main.bounds.width // 这里注意一定要把cell宽度改为屏幕的宽度或者自己想要的宽度
        newFrame.size.height = maxHeight // ios7对autolayout的支持不是很好所以最好给一个最大高度
        cell.frame = newFrame
        return cell
    }
    static func createCell()->TableViewCell {
        /* 注意，这里有个坑。如果在cell里面又加了手势的话，那就不能取数组的最后一个了。因为最后一个是手势不是cell
         */
        if let newCell = Bundle.main.loadNibNamed(ID, owner: nil, options: nil)?.last as? TableViewCell {
            return newCell;
        }else {
            let cell = TableViewCell(style: .default, reuseIdentifier: ID)
            cell.textLabel?.text = "error"
            return cell;
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    static func cell(tableView:UITableView!) -> TableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = TableViewCell.createCell()
        }
        return cell as! TableViewCell
    }
    
}
