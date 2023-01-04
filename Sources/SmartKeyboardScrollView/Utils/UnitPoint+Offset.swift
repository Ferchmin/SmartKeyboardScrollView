//
//  File.swift
//  
//
//  Created by Paweł Zgoda-Ferchmin on 04/01/2023.
//

import Foundation
import SwiftUI

public extension UnitPoint {
    static func bottomWithOffset(_ offset: CGFloat) -> UnitPoint {
        .init(x: UnitPoint.bottom.x,
              y: UnitPoint.bottom.y - offset)
    }
}
