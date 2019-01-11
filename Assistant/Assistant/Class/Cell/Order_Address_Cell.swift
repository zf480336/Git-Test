//
//  Order_Address_Cell.swift
//  Assistant
//
//  Created by lxy on 2018/11/29.
//  Copyright © 2018年 lxy. All rights reserved.
//

import UIKit

class Order_Address_Cell: UITableViewCell {

    var model:Any?{
        set{
            let wayBilldetailModel = newValue as? WayBilldetailModel
            self.orderLabel.text = wayBilldetailModel?.parentCode
            self.goodsName.text = wayBilldetailModel?.goodsName
            if ((wayBilldetailModel?.parentSubmitTime) != nil) {
                self.orderTime.text = String.init(format: "下单时间   %@", (wayBilldetailModel?.parentSubmitTime)!)
            }
            self.startStation.text = wayBilldetailModel?.startRegionName
            self.endStation.text = wayBilldetailModel?.endRegionName
            self.startTime.text = wayBilldetailModel?.estimate_departure_time
            self.endTime.text = wayBilldetailModel?.estimate_arrival_time
            self.startAddress.text = wayBilldetailModel?.parentStartAddress
            self.endAddress.text = wayBilldetailModel?.parentEndAddress
        }
        get{
            return nil
        }
    }
    
    //货品管理网点收货详情
    var orderContainerModel:Any?{
        set{
            let model = newValue as? OrderContainerModel
            self.orderLabel.text = model?.order?.parentCode
            self.goodsName.text = model?.order?.goodsName
            if ((model?.order?.estimate_finish_time) != nil) {
                self.orderTime.text = String.init(format: "下单时间   %@", (model?.order?.estimate_finish_time)!)
            }
            self.startStation.text = model?.order?.parentStartRegionName
            self.endStation.text = model?.order?.parentEndRegionName
            self.startTime.text = model?.order?.parentEstimateDepartureTime
            self.endTime.text = model?.order?.parentEstimateFinishTime
            self.startAddress.text = model?.order?.parentStartAddress
            self.endAddress.text = model?.order?.parentEndAddress
        }
        get{
            return nil
        }
    }
    
    
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var startStation: UILabel!
    @IBOutlet weak var endStation: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var status: UIButton!
    @IBOutlet weak var startAddress: UILabel!
    @IBOutlet weak var endAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
