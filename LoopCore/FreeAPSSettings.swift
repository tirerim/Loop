//
//  FreeAPS.swift
//  LoopCore
//
//  Created by Ivan Valkou on 10.06.2020.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import Foundation

public struct FreeAPSSettings: Equatable, RawRepresentable {
    public typealias RawValue = [String: Any]

    public var showRequiredCarbsOnAppBadge: Bool

    public init(showRequiredCarbsOnAppBadge: Bool = false) {
        self.showRequiredCarbsOnAppBadge = showRequiredCarbsOnAppBadge
    }

    public init?(rawValue: [String : Any]) {
        self = FreeAPSSettings()

        if let showRequiredCarbsOnAppBadge = rawValue["showRequiredCarbsOnAppBadge"] as? Bool {
            self.showRequiredCarbsOnAppBadge = showRequiredCarbsOnAppBadge
        }
    }

    public var rawValue: [String : Any] {
        [
            "showRequiredCarbsOnAppBadge": showRequiredCarbsOnAppBadge
        ]
    }
}
