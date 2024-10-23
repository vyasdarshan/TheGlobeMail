//
//  AuthorFormatter.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation

 func formatAuthors(_ authors: [String]) -> String {
    var authorsList = authors 
    switch authorsList.count {
    case 0:
        return ""
    case 1:
        return authorsList[0]
    case 2:
        return "\(authorsList[0]) and \(authorsList[1])"
    default:
        let lastAuthor = authorsList.removeLast() // Remove the last author
        return "\(authorsList.joined(separator: ", ")), and \(lastAuthor)"
    }
}
