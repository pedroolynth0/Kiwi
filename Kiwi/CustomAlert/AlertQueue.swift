//
//  AlertQueue.swift
//  Kiwi
//
//  Created by dti digital on 18/02/24.
//

import Foundation

class AlertQueue: ObservableObject {
    @Published var items: [AlertItem] = []
    
    func add(_ item: AlertItem) {
        items.append(item)
    }
    
    func remove() {
        if !items.isEmpty {
            items.removeFirst()
        }
    }
}

