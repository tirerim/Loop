//
//  FreeAPSSettingsView.swift
//  Loop
//
//  Created by Ivan Valkou on 10.06.2020.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI

struct FreeAPSSettingsView: View {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Form {
            Section {
                Toggle (isOn: $viewModel.showRequiredCarbsOnAppBadge) {
                    Text("Show required carbs on the app badge")
                }
            }
        }
        .navigationBarTitle("FreeAPS Settings")
        .modifier(AdaptsToSoftwareKeyboard())
    }
}
