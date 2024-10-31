//
//  PlusButton.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 31.10.2024.
//

import Foundation
import SwiftUI

struct PlusButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .baselineOffset(4)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .frame(width: 55, height: 55)
            .background(.specificRed)
            .clipShape(.circle)
            .padding()
    }
}
