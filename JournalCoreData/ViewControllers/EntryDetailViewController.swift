//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by James Hager on 3/28/22.
//

import UIKit

class EntryDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextView: UITextView!
    
    // MARK: - Properties
    
    var entry: Entry?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - View Methods
    
    func updateViews() {
        guard let entry = entry
        else {
            title = "Add Entry"
            return
        }
        
        title = "Entry Details"
        titleTextField?.text = entry.title
        textTextView?.text = entry.text
    }
    
    // MARK: - Actions
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        titleTextField?.text = ""
        textTextView?.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text,
              let text = textTextView.text,
              !title.isEmpty
        else { return }
        
        if let entry = entry {
            EntryController.shared.update(entry, title: title, text: text)
        } else {
            EntryController.shared.createEntry(title: title, text: text)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
