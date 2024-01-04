//
//  AppStore.swift
//  Redux
//
//  Created by Edgar Guitian Rey on 4/1/24.
//
import SwiftUI

class AppStore: ObservableObject {
    @Published private(set) var appState: AppState
    private let reducer: (AppAction, inout AppState) -> Void
    
    init(initialState: AppState, reducer: @escaping (AppAction, inout AppState) -> Void) {
        self.appState = initialState
        self.reducer = reducer
    }
    
    func reduce(action: AppAction) {
        reducer(action, &appState)
    }
}
