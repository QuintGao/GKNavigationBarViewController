//
//  ViewController.swift
//  GKNavigationBarViewControllerDemoSwift
//
//  Created by QuintGao on 2017/11/16.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarViewController

class ViewController: GKNavigationBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        gk_navBackgroundColor = UIColor.red
        
        gk_navigationItem.title = "控制器001";
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

