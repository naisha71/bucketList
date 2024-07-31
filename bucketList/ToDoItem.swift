//
//  ToDoItem.swift
//  bucketList
//
//  Created by Scholar on 30/07/2024.
//

import Foundation
import SwiftData
@Model
class ToDoItem {
    var title: String
    //var timestamp: Date
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        //self.timestamp = timestamp
        self.isImportant = isImportant
    }
}
