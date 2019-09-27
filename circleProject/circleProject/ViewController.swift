//
//  ViewController.swift
//  circleProject
//
//  Created by 香川紗穂 on 2019/09/27.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        
        let testDraw = Draw(frame: CGRect(x: 0, y: 0,
                                              width: screenWidth, height: screenHeight))
        self.view.addSubview(testDraw)
        
        // 不透明にしない（透明）
        testDraw.isOpaque = false
        
    }


}

