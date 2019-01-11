//
//  M_Task_ShipController.swift
//  Assistant
//
//  Created by lxy on 2018/11/29.
//  Copyright © 2018年 lxy. All rights reserved.
//

import UIKit

class M_Task_ShipController: My_Task_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.My_Task_enum = MyTaskList.MyTask_Ship
        setViewModel()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail_Controller = ConsigneeController.init(style: UITableViewStyle.plain)
        detail_Controller.detailModel = self.dataArray[indexPath.section]
        self.navigationController?.pushViewController(detail_Controller, animated: true)
        
    }

}
