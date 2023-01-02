//
//  Environment+Keys.swift
//  
//
//  Created by Paweł Zgoda-Ferchmin on 02/01/2023.
//

import Foundation
import SwiftUI

private struct OnTapKey: EnvironmentKey {
    static let defaultValue: (((any Hashable)?) -> Void)? = nil
}

extension EnvironmentValues {
    var onTap: (((any Hashable)?) -> Void)? {
        get { self[OnTapKey.self] }
        set { self[OnTapKey.self] = newValue }
    }
}
