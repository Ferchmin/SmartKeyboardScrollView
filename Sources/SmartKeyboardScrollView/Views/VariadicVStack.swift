//
//  VariadicVStack.swift
//  
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI

public struct VariadicVStack<Content: View>: View {
    @Environment(\.onTap) private var onTap

    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let content: Content

    public var body: some View {
        _VariadicView.Tree(VariadicVStackLayout(alignment: alignment,
                                                spacing: spacing)) {
            content
        }
    }

    public init(alignment: HorizontalAlignment = .center,
                spacing: CGFloat? = nil,
                @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }
}

private struct VariadicVStackLayout: _VariadicView_MultiViewRoot {
    @Environment(\.onTap) private var onTap

    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?

    init(alignment: HorizontalAlignment, spacing: CGFloat?) {
        self.alignment = alignment
        self.spacing = spacing
    }

    @ViewBuilder
    func body(children: _VariadicView.Children) -> some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(children) { child in
                child
                    .onTapGesture { onTap?(child.id) }
            }
        }
    }
}

