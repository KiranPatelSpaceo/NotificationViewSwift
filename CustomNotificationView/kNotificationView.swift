//
//  kNotificationView.swift
//  NavigationNoticeExample
//
//  Created by Kiran Patel on 6/17/16.
//  Copyright © 2016 kyohei_ito. All rights reserved.
//

import Foundation
import UIKit
protocol ButtonDelegate {
    func onButtonTap(sender: Dictionary<String,String>)
}
class kNotificationView: UIView {
    @IBOutlet var btnContainerView: UIButton!
    @IBOutlet var imgViewIcon: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var btnClose: UIButton!
    var timer = NSTimer()
    var delegate: ButtonDelegate?
    var dictData: Dictionary<String,String> = Dictionary()
  //  let notificationWindow = kNotificationWindow(frame: CGRect(x: 0,y: 0,width:320,height: 100))
    @IBOutlet var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "kNotificationCustomView", bundle: bundle)
        // load outlets to self
        nib.instantiateWithOwner(self, options: nil)
        self.clipsToBounds = true
        self.addSubview(self.view);
        self.view.backgroundColor = UIColor.yellowColor()
        self.btnClose.addTarget(self, action: "btnClosePressed:", forControlEvents: .TouchUpInside)
         self.btnContainerView.addTarget(self, action: "btnContainerViewPressed:", forControlEvents: .TouchUpInside)
    }
    func notifyWithCustomView(text : String?, detail: String?, image:UIImage? ,imageURL:NSURL?, aDict: Dictionary<String,String>) {
        self.lblTitle.text = text
        self.lblDesc.text = detail
        if (image != nil) {
            imgViewIcon.image = image
        }else{
            // SDWebImageView load from URL
        }
        self.dictData = aDict
        timer.invalidate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target:self, selector: Selector("someSelector"), userInfo: nil, repeats: false)
        
    }
    func someSelector() {
        print("someSelector")
        timer.invalidate()
        delegate?.onButtonTap( self.dictData)

        // Something after a delay
    }
    func btnClosePressed(sender:UIButton){
        timer.invalidate()
        delegate?.onButtonTap( self.dictData)

    }
    func btnContainerViewPressed(sender:UIButton){
        timer.invalidate()
        delegate?.onButtonTap( self.dictData)

    }
   
}

