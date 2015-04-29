//
//  WormholeWrapper.swift
//  ionic-watch
//
//  Created by Scott Weinert on 4/27/15.
//
//

import Foundation

class WormholeWrapper {
    
    var wormhole: MMWormhole!
    
    init() {
        createWormhole()
    }
    
    func createWormhole() {
        wormhole = MMWormhole(applicationGroupIdentifier: "group.unbill.watchkit", optionalDirectory: nil)
    }
    
    func sendMessage(text: String, identifier: String) {
        wormhole.passMessageObject(text, identifier: identifier)
    }
    
    func listen(identifier: String, completion: ((message: AnyObject) -> Void)!) {
        wormhole.listenForMessageWithIdentifier(identifier, listener: { (message) -> Void in
            if var messageToReturn: AnyObject = message {
                completion(message: messageToReturn)
            }
        })
    }
    
    func JSONParseDictionary(jsonString: String) -> [String: AnyObject] {
        if let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding) {
            if let dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [String: AnyObject] {
                return dictionary
            }
        }
        return [String: AnyObject]()
    }
    
    func getMessage(identifier: String) -> JSON {
        let dictionary = JSONParseDictionary(wormhole.messageWithIdentifier(identifier) as! String)
        let json = JSON(dictionary)
        return json
//        if let dataObject = json["data"].string {
//            return dataObject
//        } else {
//            println(json["data"].error)
//        }
    }
}