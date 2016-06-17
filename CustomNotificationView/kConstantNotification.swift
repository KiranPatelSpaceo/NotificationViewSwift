//
//  kConstantNotification.swift
//  CustomNotificationView
//
//  Created by Kiran Patel on 6/17/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
let objNotificationView = kNotificationView()

class kConstantNotification: ButtonDelegate{
    typealias bCompletionHandler = (Dictionary<String, String>) -> ()
     var CompletionHandler : bCompletionHandler?
    
    func showCustomNotification(aTitle: String, aDesc: String, aImageLogo: UIImage, aData: Dictionary<String, String>, Handler:bCompletionHandler){
        //objNotificationView.removeFromSuperview()
        CompletionHandler = Handler
        objNotificationView.frame = CGRect(x: 0, y: -objNotificationView.view.frame.height, width: UIScreen.mainScreen().bounds.width, height: 100)
        objNotificationView.view.frame = CGRect(x: 0, y: 0, width:  UIScreen.mainScreen().bounds.width, height: 100)
        objNotificationView.delegate = self
        objNotificationView.notifyWithCustomView(aTitle, detail: aDesc, image: aImageLogo, imageURL: nil ,aDict: aData)
        appDelegate.window!.addSubview(objNotificationView)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            objNotificationView.frame = CGRect(x: 0, y: 0, width:  UIScreen.mainScreen().bounds.width, height: objNotificationView.view.frame.height)
            }) { (completion) -> Void in
               
        }
    }
    func showCustomNotificationWithImageURL(aTitle: String, aDesc: String, aImageUrl: NSURL, aData: Dictionary<String, String>){
        //objNotificationView.removeFromSuperview()
        
        objNotificationView.frame = CGRect(x: 0, y: -objNotificationView.view.frame.height, width: UIScreen.mainScreen().bounds.width, height: 100)
        objNotificationView.view.frame = CGRect(x: 0, y: 0, width:  UIScreen.mainScreen().bounds.width, height: 100)
        objNotificationView.delegate = self
        objNotificationView.notifyWithCustomView(aTitle, detail:aDesc, image:nil, imageURL:aImageUrl,aDict: aData)
        
        appDelegate.window!.addSubview(objNotificationView)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .BeginFromCurrentState, animations: { () -> Void in
            objNotificationView.frame = CGRect(x: 0, y: 0, width:  UIScreen.mainScreen().bounds.width, height: objNotificationView.view.frame.height)
            }) { (completion) -> Void in
                
        }
        
    }
    func someSelector() {
        print("someSelector")
        // Something after a delay
    }
    func onButtonTap(sender: Dictionary<String, String>) {
        if CompletionHandler != nil {
            CompletionHandler!(sender)
        }
        objNotificationView.removeFromSuperview()
        

    }
}