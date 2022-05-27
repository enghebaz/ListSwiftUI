//
//  LoaderView.swift
//  ListSwiftUI
//
//  Created by Heba on 26/05/2022.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading..")
            .foregroundColor(isFailed ? .red : .green)
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}

