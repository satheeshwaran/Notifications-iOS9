//
//  ViewController.swift
//  Notifications-iOS9
//
//  Created by Satheeshwaran J on 03/08/15.
//  Copyright © 2015 Satheeshwaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localNotification:UILocalNotification = UILocalNotification()
        
        localNotification.alertAction = "Testing inline reply notificaions on iOS9"
        
        localNotification.alertBody = "Woww it works!!"
        
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 30)
        
        localNotification.category = "INVITE_CATEGORY";
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

