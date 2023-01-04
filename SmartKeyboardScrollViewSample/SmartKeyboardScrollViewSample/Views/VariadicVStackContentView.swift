//
//  VariadicVStackContentView.swift
//  SmartKeyboardScrollViewSample
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI
import SmartKeyboardScrollView

struct VariadicVStackContentView: View {
    var body: some View {
        NavigationView {
            SmartKeyboardScrollView {
                VariadicVStack(spacing: 0) {
                    Text("If content is placed inside a VariadicVStack, the view will try to scroll to the last tapped input view.")
                        .padding()
                    Color.yellow.frame(height: 400)
                    TextField("0", text: .constant(""))
                    Color.red.frame(height: 200)
                    TextField("1", text: .constant(""))
                    Color.blue.frame(height: 200)
                    TextField("2", text: .constant(""))
                }
            } footer: {
                FooterView()
            }
            .navigationTitle("VariadicVStack Sample")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
