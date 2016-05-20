//
//  Entry.swift
//  Notes-IOS-Challenge
//
//  Created by Mason Earl on 5/20/16.
//  Copyright © 2016 Mason Earl. All rights reserved.
//

import Foundation

class Entry: Equatable {
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    init(timestamp: NSDate = NSDate(), title: String, bodyText: String) {
        
        self.timestamp = timestamp
        self.bodyText = bodyText
        self.title = title
    }
    
    // Add Failable Initializer
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let title = dictionary[titleKey] as? String,
        bodyText = dictionary[bodyTextKey] as? String,
            timestamp = dictionary[timestampKey] as? NSDate else {
        
                self.title = ""
                self.bodyText = ""
                self.timestamp = NSDate()
                
                return nil
    }
    
                self.title = title
                self.bodyText = bodyText
                self.timestamp = timestamp
    }
    
    func dictionaryCopy() -> Dictionary<String,AnyObject> {
        let dictionary = [
            timestampKey: self.timestamp,
            titleKey: self.title,
            bodyTextKey: self.bodyTextKey]
        return dictionary 
        
    }
    
}
func == (lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}