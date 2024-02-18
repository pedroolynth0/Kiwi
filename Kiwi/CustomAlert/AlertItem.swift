//
//  AlertItem.swift
//  Kiwi
//
//  Created by dti digital on 18/02/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text?
    let dismissButton: Alert.Button?
    let primaryButton: Alert.Button?
    let secondaryButton: Alert.Button?
    
    // Alerta com um único botão de confirmação
    init(title: Text, message: Text? = nil, dismissButton: Alert.Button? = nil) {
        self.title = title
        self.message = message
        self.dismissButton = dismissButton
        self.primaryButton = nil
        self.secondaryButton = nil
    }
    
    // Alerta com ações e dois botões
    init(title: Text, message: Text? = nil, primaryButton: Alert.Button, secondaryButton: Alert.Button) {
        self.title = title
        self.message = message
        self.dismissButton = nil
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
}



