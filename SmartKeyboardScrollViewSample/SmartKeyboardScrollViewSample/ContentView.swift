//
//  ContentView.swift
//  SmartKeyboardScrollViewSample
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BasicContentView().tabItem { Text("Base") }
            FocusStateContentView().tabItem { Text("FocusState") }
            VariadicVStackContentView().tabItem { Text("Variadic") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
