//
//  CustomDividers.swift
//  Moonshot
//
//  Created by Chris Peloso on 2/20/22.
//

import SwiftUI

struct CustomDividers: View {
    var body: some View {
        Rectangle()
            .frame(height:2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDividers_Previews: PreviewProvider {
    static var previews: some View {
        CustomDividers()
    }
}
