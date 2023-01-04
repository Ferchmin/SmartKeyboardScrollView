//
//  FooterView.swift
//  SmartKeyboardScrollViewSample
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI

struct FooterView: View {
    var body: some View {
        Color.green.frame(height: 50)
            .shadow(radius: 5, y: -5)
            .overlay { Text("Footer") }
    }
}
