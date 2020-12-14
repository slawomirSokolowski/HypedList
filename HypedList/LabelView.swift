//
//  LabelView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct LabelView: View {
    
    var title: String
    var iconSystemName: String
    var color: Color
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: iconSystemName)
        }
        .padding(4)
        .background(color)
        .cornerRadius(7)
        .foregroundColor(.white)
        
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(title: "URL", iconSystemName: "link", color: .orange)
    }
}
