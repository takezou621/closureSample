//
//  ViewController.swift
//  ClosureSample
//
//  Created by Takeshi Kawai on 2015/01/26.
//  Copyright (c) 2015年 Takeshi Kawai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pressureLabel: UILabel!
    let closureClass = ClosureClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 気圧センサーの情報を取得する
        self.closureClass.retrievePressure { (result:String) -> Void in
            self.pressureLabel.text = result
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

