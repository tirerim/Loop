//
//  TempBasalView.swift
//  Loop
//
//  Created by Ivan Valkou on 07.01.2020.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI
import Combine

struct TempBasalView: View {
    @State private var amount: String = ""
    @State private var duration: String = ""

    let recommendation = PassthroughSubject<TempBasalRecommendation?, Never>()

    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        return formatter
    }()

    var body: some View {
        Form {
            Section {
                TextField("Amount (U/h)", text: $amount).keyboardType(.decimalPad)
                TextField("Duration (min)", text: $duration).keyboardType(.decimalPad)
                Button(action: {
                    guard let amount = self.formatter.number(from: self.amount)?.doubleValue,
                    let duration = self.formatter.number(from: self.duration)?.doubleValue
                    else {
                        self.recommendation.send(nil)
                        return
                    }
                    self.recommendation.send(.init(unitsPerHour: amount, duration: duration * 60))
                }) {
                    Text("Set")
                }
            }

        }
        .navigationBarTitle("Manual Temp Basal")
    }
}

struct TempBasalView_Previews: PreviewProvider {
    static var previews: some View {
        TempBasalView()
    }
}
