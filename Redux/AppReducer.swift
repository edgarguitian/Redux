//
//  AppReducer.swift
//  Redux
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class AppReducer {
    // MARK: Singleton instance
    static let shared = AppReducer()
    
    func appReducer(action: AppAction, state: inout AppState) {
        switch action {
        case .loadItems:
            addNewElement(state: &state)
        case .deleteItems:
            removeLastItem(state: &state)
        }
    }
    
    func addNewElement(state: inout AppState) {
        if let lastElement = state.items.last,
           let number = Int(lastElement.components(separatedBy: " ").last ?? "") {
            let newElement = "Test \(number + 1)"
            state.items.append(newElement)
        } else {
            state.items.append("Test 1")
        }
    }
    
    func removeLastItem(state: inout AppState) {
        state.items.removeLast()
    }
}
