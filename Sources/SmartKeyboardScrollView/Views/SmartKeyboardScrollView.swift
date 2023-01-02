//
//  SmartKeyboardScrollView.swift
//  
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI

/**
 SmartKeyboardScrollView creates a ScrollView that automatically adjusts content offset to avoid system keyboard while at the same time allows adding a sticky footer that ignores the keyboard.

 This view uses only native SwiftUI mechanics and does not rely on UIResponder.keyboardDidShowNotification.

 # Usage
 You can provide content in different ways to improve how the scrolling mechanism works:

 1. Providing @FocusState allows the ScrollView to always keep the active TextField visible
 2. Placing content in VariadicVStack makes scrolling to active TextField more responsive
 3. Not using any of the above will still work, just slower.

 #Limitations
 - Using NavigationView with .large title display mode break scrolling animation when title is collapsing
 - Using some ViewModifiers such as .padding() on the SmartKeyboardScrollView itself can break the mechanism. Using any modifiers on the content/footer works fine.

 # Example
 ```
 @FocusState private var focusState: String?

 SmartKeyboardScrollView(focusState: _focusState) {
    TextField("Example", text: .constant(""))
        .id("0")
        .focused($focusState, equals: "0")
 } footer {
    // Place any footer here
 }
 ```
*/
public struct SmartKeyboardScrollView<Content, Footer, Focus>: View where Content: View,
                                                                          Footer: View,
                                                                          Focus: Hashable {
    @State private var frameHeight: CGFloat = 0
    @State private var availableHeight: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    @State private var footerHeight: CGFloat = 0
    @State private var lastTappedId: (any Hashable)?

    private let focusState: FocusState<Focus?>?
    private let content: () -> Content
    private let footer: () -> Footer

    private var bottomPadding: CGFloat {
        max(0, frameHeight - availableHeight - footerHeight)
    }

    public var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 0, content: content)
                        .readSize { contentHeight = $0.height }
                }
                .padding(.bottom, bottomPadding)
                footer()
                    .readSize { footerHeight = $0.height }
            }
            .readSize { frameHeight = $0.height }
            .ignoresSafeArea(.keyboard)
            .readSize { sizeChanged(to: $0, scrollViewProxy: proxy) }
            .onChange(of: focusState?.wrappedValue) { scroll(to: $0, using: proxy) }
            .environment(\.onTap, { lastTappedId = $0 })
        }
    }

    public init(focusState: FocusState<Focus?>? = Optional<FocusState<String?>>.none,
                @ViewBuilder content: @escaping () -> Content,
                @ViewBuilder footer: @escaping () -> Footer = { EmptyView() }) {
        self.focusState = focusState
        self.content = content
        self.footer = footer
    }

    private func sizeChanged(to availableSize: CGSize,
                             scrollViewProxy: ScrollViewProxy) {
        // keyboard did appear
        if availableSize.height < availableHeight {
            availableHeight = availableSize.height
            if let lastTappedId,
               focusState == nil,
               contentHeight > availableHeight {
                scroll(to: lastTappedId, using: scrollViewProxy)
                self.lastTappedId = nil
            }
            // keyboard did disappear
        } else {
            withAnimation(.easeOut(duration: 0.25)) {
                availableHeight = availableSize.height
            }
        }
    }

    private func scroll(to id: some Hashable, using proxy: ScrollViewProxy) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) {
            withAnimation(.easeOut(duration: 0.25)) {
                proxy.scrollTo(id)
            }
        }
    }
}

