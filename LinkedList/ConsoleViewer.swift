//
//  ConsoleViewer.swift
//  LinkedList
//
//  Created by Vanesa Korbenfeld on 10/05/2023.
//

import Foundation

class ConsoleViewer: Console {
    private(set) var printed: String?

    func print(_ message: String?) {
        printed = message
    }
}
