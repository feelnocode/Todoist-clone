//
//  AddButtonView.swift
//  todoist-clone
//
//  Created by Andrii Pashuta on 30.10.2024.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Button("+"){}
            .foregroundStyle(.white)
            .font(.largeTitle)
            .frame(width: 70, height: 70)
            .background(.specificRed)
            .clipShape(.circle)
            .padding()
    }
}

#Preview {
    AddButtonView()
}
