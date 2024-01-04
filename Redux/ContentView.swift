//
//  ContentView.swift
//  Redux
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store: AppStore = AppStore(initialState: AppState(),
                                                reducer: AppReducer.shared.appReducer)
    var body: some View {
        NavigationView {
            List {
                ForEach(store.appState.items, id: \.self) { item in
                    Text(item)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Delete") {
                        store.reduce(action: .deleteItems)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        store.reduce(action: .loadItems)
                    }
                }
            }
            .navigationTitle("Items")
        }
    }
}

#Preview {
    ContentView()
}
