//
//  FocusStateContentView.swift
//  SmartKeyboardScrollViewSample
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI
import SmartKeyboardScrollView

struct FocusStateContentView: View {
    @FocusState private var focusState: Int?

    var body: some View {
        NavigationView {
            SmartKeyboardScrollView(focusState: _focusState,
                                    scrollAnchor: .bottomWithOffset(0.1)) {
                Text("If focusState is provided to SmartKeyboardScrollView view will scroll to the focused input view.")
                    .padding()
                Color.yellow.frame(height: 400)
                TextField("0", text: .constant(""))
                    .id(0)
                    .focused($focusState, equals: 0)
                Color.red.frame(height: 200)
                TextField("1", text: .constant(""))
                    .id(1)
                    .focused($focusState, equals: 1)
                Color.blue.frame(height: 200)
                TextField("2", text: .constant(""))
                    .id(2)
                    .focused($focusState, equals: 2)
            } footer: {
                FooterView()
            }
            .toolbar { ToolbarItem(placement: .keyboard) { KeyboardToolbar(focusState: _focusState) } }
            .navigationTitle("FocusState Sample")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct KeyboardToolbar: View {
    private var focusState: FocusState<Int?>

    private var prev: Int? {
        switch focusState.wrappedValue {
        case 1: return 0
        case 2: return 1
        default: return nil
        }
    }

    private var next: Int? {
        switch focusState.wrappedValue {
        case 0: return 1
        case 1: return 2
        default: return nil
        }
    }

    var body: some View {
        HStack {
            Button { focusState.wrappedValue = prev } label: {
                Image(systemName: "arrowtriangle.up.fill")
            }
            Button { focusState.wrappedValue = next } label: {
                Image(systemName: "arrowtriangle.down.fill")
            }
            Spacer()
            Button("Done") { focusState.wrappedValue = nil }
                .buttonStyle(.borderless)
        }
        .buttonStyle(.bordered)
    }

    init(focusState: FocusState<Int?>) {
        self.focusState = focusState
    }
}
