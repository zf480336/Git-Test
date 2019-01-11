//
//  AddressInfoCell.swift
//  Assistant
//
//  Created by lxy on 2018/11/29.
//  Copyright © 2018年 lxy. All rights reserved.
//

import UIKit

class AddressInfoCell: UITableViewCell {

    var model:Any?{
        set{
            let wayBilldetailModel = newValue as? WayBilldetailModel
            self.startCity.text = wayBilldetailModel?.startEntrePortName
            self.startName.text = wayBilldetailModel?.start_contacts
            self.startAddress.text = wayBilldetailModel?.start_address
            self.endCity.text = wayBilldetailModel?.endEntrePortName
            self.endName.text = wayBilldetailModel?.end_contacts
            self.endAddress.text = wayBilldetailModel?.end_address

        }
        get{
            return nil
        }
    }
    
    var orderContainerModel:Any?{
        set{
            let model = newValue as? OrderContainerModel
            if model == nil {
                return;
            }
            self.startCity.text = model?.order?.startRegionName
            self.startName.text = model?.order?.start_contacts
            self.startAddress.text = model?.order?.start_address
            self.endCity.text = model?.order?.endRegionName
            self.endName.text = model?.order?.end_contacts
            self.endAddress.text = model?.order?.end_address
        }
        get{
            return nil
        }
    }
    
    @IBOutlet weak var startCity: UILabel!
    @IBOutlet weak var startName: UILabel!
    @IBOutlet weak var startAddress: UILabel!
    @IBOutlet weak var endCity: UILabel!
    @IBOutlet weak var endName: UILabel!
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
