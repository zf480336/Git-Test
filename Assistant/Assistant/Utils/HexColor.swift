//
//  StringHexColor.swift
//  Assistant
//
//  Created by lxy on 2018/11/27.
//  Copyright © 2018年 lxy. All rights reserved.
//

import UIKit

class HexColor: NSObject {
    static func getHex(hexString:String,alpha:CGFloat)->UIColor {
        print(hexString.count)
        let tmpstring = hexString.replacingOccurrences(of: "#", with: "")
        guard hexString.count != 6 else { return UIColor.clear }
        var tmpStr = tmpstring
        var i = 0
        var data = Data()
        for _ in 0..<tmpstring.count/2 {
            let index = tmpStr.index((tmpStr.startIndex), offsetBy: 2)
            let str = String(tmpStr.prefix(upTo: index))
            tmpStr.removeSubrange(str.startIndex..<index)
            var result:UInt32 = 0
            Scanner(string: str).scanHexInt32(&result)
            data.append(UInt8(result))
            i = i+2
        }
        return UIColor.init(red: CGFloat(data[0])/255.0, green: CGFloat(data[1])/255.0, blue: CGFloat(data[2])/255.0, alpha: alpha)
    }
    //MARK: - 获取渐变颜色
    static func graduaBackColor(beginColor:UIColor,endColor:UIColor,view:UIView) ->Void {
        let gradientColors: [CGColor] = [beginColor.cgColor, endColor.cgColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint.init(x: 0, y:1)
        gradientLayer.endPoint = CGPoint.init(x: 1,y:1)
         gradientLayer.frame = CGRect.init(x: 0, y: 0, width: SCREEN_W, height: Int(view.bounds.size.height))
//        if IPHONE_X() {
//
//        }else{
//            gradientLayer.frame = CGRect.init(x: 0, y: 0, width: SCREEN_W, height: view.bounds.size.height)
//        }
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
