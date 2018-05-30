//
//  NoteController.swift
//  Journal 3.0
//
//  Created by Adam on 29/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

class NoteController {
    
    // MARK: - Properties
    // Shared Instance
    static let shared = NoteController()
    // Source of Truth
    var notes: [Note] = []
    
    init() {
        if !self.notes.isEmpty {
        self.notes = load()
        }
    }
    // Create
    func addNoteWith(title: String, body: String) {
        
        let note = Note(title: title, body: body)
        self.notes.append(note)
        save()
    }
    
    // Read
    func fileURL() -> URL {
        // 1) Use fileManager to get users documentDirectory (default is the shared instance)
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        // Create a custom file path
        let noteLocation = "journal.json" // turns our object into something it can locate
        let url = documentDirectory.appendingPathComponent(noteLocation)
        
        return url
    }
    
    func save() {
        let jsonEnconder = JSONEncoder()
        //2) Create data
        do {
            let data = try jsonEnconder.encode(notes)
            try data.write(to: fileURL())
        } catch {
            print("❌Error encoding data: \(error.localizedDescription)")
        }
    }
    
    // Update
    func load() -> [Note] {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let notes = try jsonDecoder.decode([Note].self, from: data)
            return notes
        } catch {
            print("❌ Error decoding data: \(error.localizedDescription)")
            return []
        }
  
    }
    
    // Delete
    func delete(note: Note) {
        guard let index = notes.index(of: note) else { return }
        notes.remove(at: index)
        save()
    }
}
















