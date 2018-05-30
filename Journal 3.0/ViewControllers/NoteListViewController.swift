//
//  NoteListViewController.swift
//  Journal 3.0
//
//  Created by Adam on 29/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addNoteBtnPressed(_ sender: UIBarButtonItem) {
        presentNoteAlertController()
    }
    
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        let note = NoteController.shared.notes[indexPath.row]
        cell.textLabel?.text = note.title
        return cell
    }
}

extension NoteListViewController {
    
    func presentNoteAlertController() {
        // 1 Create an optional textfield variable
        var noteTextField: UITextField?
        // 2 Initialize the actual alert controller
        let alertController = UIAlertController(title: "New Note", message: nil, preferredStyle: .alert)
        // 3 Add textField to alertController
        alertController.addTextField { (textField) in
            noteTextField = textField
        }
        
        // 4 Add Actions
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            // What happens when you press a button
            guard let note = noteTextField?.text else { return }
            NoteController.shared.addNoteWith(title: note, body: "Add Note Here")
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // 5 - Add actions to alert controller
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        // 6 - present Alert Controller
        present(alertController, animated: true)
        
    }
}





















