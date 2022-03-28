//
//  EntryListViewController.swift
//  JournalCoreData
//
//  Created by James Hager on 3/28/22.
//

import UIKit

class EntryListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Actions
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showEntryDetails",
              let destination = segue.destination as? EntryDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        destination.entry = EntryController.shared.entries[indexPath.row]
    }
}

// MARK: - UITableViewDataSource

extension EntryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EntryController.shared.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = EntryController.shared.entries[indexPath.row].title
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        EntryController.shared.deleteEntry(atIndex: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
