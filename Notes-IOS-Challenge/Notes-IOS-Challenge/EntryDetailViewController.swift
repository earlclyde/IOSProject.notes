//
//  EntryListDetailViewController.swift
//  Notes-IOS-Challenge
//
//  Created by Mason Earl on 5/20/16.
//  Copyright © 2016 Mason Earl. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Thoughts"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = entry {
            updateWithEntry(entry)
        }
    }

    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.bodyText = self.bodyTextView.text
            entry.timestamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, bodyText: self.bodyTextView.text)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.bodyText
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
}

}
