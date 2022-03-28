//
//  Journal.swift
//  JournalCoreData
//
//  Created by James Hager on 3/28/22.
//

import CoreData

@objc(Entry)
class Entry: NSManagedObject {
    
    @discardableResult convenience init(title: String, text: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
}

// MARK: - CoreData Properties

extension Entry {
    @NSManaged var title: String
    @NSManaged var text: String
    @NSManaged var timestamp: Date
}
