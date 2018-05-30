//
//  Note.swift
//  Journal 3.0
//
//  Created by Adam on 29/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

struct Note : Codable, Equatable {
    var title: String
    var body: String
    
    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body
    }
}
