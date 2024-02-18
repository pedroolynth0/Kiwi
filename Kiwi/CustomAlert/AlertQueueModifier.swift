//
//  AlertQueueModifier.swift
//  Kiwi
//
//  Created by dti digital on 18/02/24.
//

import SwiftUI

struct AlertQueueModifier: ViewModifier {
    @ObservedObject var queue: AlertQueue
    
    func body(content: Content) -> some View {
        content
            .alert(item: Binding(get: {
                queue.items.first
            }, set: { _ in
                queue.remove()
            })) { item in
                if let primaryButton = item.primaryButton, let secondaryButton = item.secondaryButton {
                    return Alert(title: item.title, message: item.message, primaryButton: primaryButton, secondaryButton: secondaryButton)
                } else {
                    return Alert(title: item.title, message: item.message, dismissButton: item.dismissButton ?? .default(Text("OK")))
                }
            }
    }
}

extension View {
    func alertQueue(_ queue: AlertQueue) -> some View {
        self.modifier(AlertQueueModifier(queue: queue))
    }
}
