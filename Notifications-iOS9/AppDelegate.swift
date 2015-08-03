//
//  AppDelegate.swift
//  Notifications-iOS9
//
//  Created by Satheeshwaran J on 03/08/15.
//  Copyright © 2015 Satheeshwaran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        //creating the inline reply notification action
        let replyAction = UIMutableUserNotificationAction()
        replyAction.title = "Say Something"
        replyAction.identifier = "inline-reply"
        replyAction.activationMode = .Background
        replyAction.authenticationRequired = false
        replyAction.behavior = .TextInput
        

        //creating a category
        let notificationCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        notificationCategory.identifier = "INVITE_CATEGORY"
        notificationCategory .setActions([replyAction], forContext: UIUserNotificationActionContext.Default)
        
        //registerting for the notification.
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes:[ UIUserNotificationType.Sound, UIUserNotificationType.Alert,
            UIUserNotificationType.Badge], categories: NSSet(array:[notificationCategory]) as? Set<UIUserNotificationCategory>))
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void){
    
        if identifier == "inline-reply"{
            if let response = responseInfo[UIUserNotificationActionResponseTypedTextKey],
            responseText = response as? String {
            NSLog(responseText)
            }
    }
    completionHandler()
    
    }


}

