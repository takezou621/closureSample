//
//  ClosureClass.swift
//  ClosureSample
//
//  Created by Takeshi Kawai on 2015/01/26.
//  Copyright (c) 2015年 Takeshi Kawai. All rights reserved.
//

import UIKit
import CoreMotion

class ClosureClass: NSObject {
    
    let altimeter = CMAltimeter()
    
    func retrievePressure(completionHandler: (result:String) -> Void) {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            println("対応機種")
            self.altimeter.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.mainQueue()) {
                [weak self] (data: CMAltitudeData!, error: NSError!) in
                if error == nil {
                   // 正常
                    var text = String(format: "%.2f", data.pressure.doubleValue*10)
                    
                    // 計測を停止
                    self?.altimeter.stopRelativeAltitudeUpdates()
                    completionHandler(result: text)
                }else{
                   // エラー
                    println("error")
                }
            }
        }
        else{
            println("非対応機種")
        }
    }
}
