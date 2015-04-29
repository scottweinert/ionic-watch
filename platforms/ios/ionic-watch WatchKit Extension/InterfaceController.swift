//
//  InterfaceController.swift
//  ionic-watch WatchKit Extension
//
//  Created by Scott Weinert on 4/27/15.
//
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var wormhole = WormholeWrapper()
    @IBOutlet weak var testLabel: WKInterfaceLabel!
    @IBOutlet weak var radialGroup: WKInterfaceGroup!
    let duration = 0.7
    var currentValue = 128
    var maxValue = 198
    var didLoadAlready = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        radialGroup.setBackgroundImageNamed("radial-green")
        self.setTitle("April")
        if var data: JSON = wormhole.getMessage("inbox") as JSON? {
            println("got initial message")
            println(data)
//            setText(data as! String)
        }
        
        wormhole.listen("inbox", completion: { (message) -> Void in
            println("working")
            println(message)
        })
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Animate radial gauge
        if (!didLoadAlready) {
            radialGroup.startAnimatingWithImagesInRange(NSMakeRange(0, 40), duration: self.duration, repeatCount: 1)
            didLoadAlready = true
        }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        radialGroup.startAnimatingWithImagesInRange(NSMakeRange(40, 0), duration: self.duration, repeatCount: 1)
        super.didDeactivate()
    }
    
}
