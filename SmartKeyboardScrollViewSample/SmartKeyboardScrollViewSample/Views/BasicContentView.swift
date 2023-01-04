//
//  BasicContentView.swift
//  SmartKeyboardScrollViewSample
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI
import SmartKeyboardScrollView

struct BasicContentView: View {
    var body: some View {
        NavigationView {
            SmartKeyboardScrollView {
                Text("The frame of ScrollView will be adjusted to fit the scrollable content above system keyboard. The view will also scroll to selected input if needed.")                    .padding()
                Color.yellow.frame(height: 400)
                TextField("0", text: .constant(""))
                Color.red.frame(height: 200)
                TextField("1", text: .constant(""))
                Color.blue.frame(height: 200)
                TextField("2", text: .constant(""))
            } footer: {
                FooterView()
            }
            .navigationTitle("Basic Sample")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
