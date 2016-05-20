//
//  EntryController.swift
//  Notes-IOS-Challenge
//
//  Created by Mason Earl on 5/20/16.
//  Copyright © 2016 Mason Earl. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "storedEntriesKey"
    
    static let sharedController = EntryController()
    
    var entries: [Entry] = []
    
    init() {
       
        self.entries = []
        
        self.loadFromPersistentStorage()
    }
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
       //have to navigate through your index here (if let) 
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
        
            self.saveToPersistentStorage()
       
    }
    
        func loadFromPersistentStorage() {
            
            let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [Dictionary <String, AnyObject>]
            
            if let entryDictionaries = entryDictionariesFromDefaults {
                
                self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
            }
        }
        
        func saveToPersistentStorage() {
            
            let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
           
            NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entryKey)
        
    }
}