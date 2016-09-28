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
    var isCalculateHeight = false
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbDesc: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var conImgRight: NSLayoutConstraint!
    
    var news : CellModel? {
        didSet {
            self.lbTitle.text = news?.title
            self.lbDesc.text = news?.desc
            self.lbTime.text = news?.time
            var showImg = false
            if (news?.imageUrl?.characters.count)! == 0 {
                conImgRight.constant = -80
            }else {
                conImgRight.constant = 15
                showImg = true
            }
            layoutIfNeeded()
            if isCalculateHeight == true {
                var cellHeight = CGFloat(lbTime.frame.maxY + 12)
                if showImg == true {
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
        cell.isCalculateHeight = true
        var newFrame = cell.frame
        newFrame.size.width = UIScreen.main.bounds.width
        newFrame.size.height = maxHeight
        cell.frame = newFrame
        return cell
    }
    static func createCell()->TableViewCell {
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
            /* 注意，这里有个坑。如果在cell里面又加了手势的话，那就不能取数组的最后一个了。因为最后一个是手势不是cell
             */
            cell = TableViewCell.createCell()
            
        }
        
        return cell as! TableViewCell
    }
    
}
