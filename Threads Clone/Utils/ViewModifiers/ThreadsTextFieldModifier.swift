//
//  ThreadsTextFieldModifier.swift
//  Threads Clone
//
//  Created by Arnav Aggarwal on 27/08/23.
//

import SwiftUI

struct ThreadsTextFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
