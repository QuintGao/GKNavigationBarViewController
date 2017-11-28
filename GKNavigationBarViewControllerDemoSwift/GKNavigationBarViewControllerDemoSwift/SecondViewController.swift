//
//  SecondViewController.swift
//  GKNavigationBarViewControllerDemoSwift
//
//  Created by QuintGao on 2017/11/16.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "123"
        
        view.backgroundColor = UIColor.brown
        
        let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        backBtn.setImage(UIImage(named: "btn_back_black"), for: .normal)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
