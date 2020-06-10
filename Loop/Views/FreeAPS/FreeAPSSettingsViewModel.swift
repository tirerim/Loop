//
//  FreeAPSSettingsViewModel.swift
//  Loop
//
//  Created by Ivan Valkou on 10.06.2020.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopCore
import Combine

extension FreeAPSSettingsView {
    final class ViewModel: ObservableObject {
        @Published var showRequiredCarbsOnAppBadge: Bool

        private var lifetime = Set<AnyCancellable>()

        init(settings: FreeAPSSettings) {
            showRequiredCarbsOnAppBadge = settings.showRequiredCarbsOnAppBadge
        }

        func changes() -> AnyPublisher<FreeAPSSettings, Never> {
            $showRequiredCarbsOnAppBadge.map { FreeAPSSettings(showRequiredCarbsOnAppBadge: $0) }
                .eraseToAnyPublisher()
        }
    }
}
