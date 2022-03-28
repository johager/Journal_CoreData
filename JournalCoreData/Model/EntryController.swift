//
//  EntryController.swift
//  JournalCoreData
//
//  Created by James Hager on 3/28/22.
//

import CoreData

class EntryController {
    
    // MARK: - singleton
    
    static let shared = EntryController()
    
    // MARK: - Properties
    
    var entries = [Entry]()
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        return request
    }()
    
    private init() {
        fetchEntries()
    }
    
    // MARK: - CRUD
    
    func createEntry(title: String, text: String) {
        entries.append(Entry(title: title, text: text))
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        do {
            entries = try CoreDataStack.context.fetch(fetchRequest)
        } catch {
            print("Error performing fetchRequest: \(error)")
        }
    }
    
    func update(_ entry: Entry, title: String, text: String) {
        entry.title = title
        entry.text = text
        CoreDataStack.saveContext()
    }
}
