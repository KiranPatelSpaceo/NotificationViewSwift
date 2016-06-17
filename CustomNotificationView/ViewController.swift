//
//  ViewController.swift
//  CustomNotificationView
//
//  Created by Kiran Patel on 6/17/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnShowPressed(sender: AnyObject) {
        let noti  = kConstantNotification()
        let someDict:[String:String] = ["key1":"One","key2":"Two", "key3":"Three"]
        noti.showCustomNotification("Demo Test", aDesc: "Demo Descption", aImageLogo: UIImage(named: "1.jpg")!, aData: someDict) { (result) -> () in
            print(result)
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

