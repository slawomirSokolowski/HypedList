//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @State var showTime = false
    @State var showImagePicker = false
    @StateObject var hypedEvent = HypedEvent()
    
    var body: some View {
        Form {
            Section {
                LabelView(title: "title", iconSystemName: "keyboard", color: .green)
                TextField("Family vacation", text: $hypedEvent.title)
            }
            Section {
                LabelView(title: "Date", iconSystemName: "calendar", color: .blue)
            }
            Section {
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime) {
                    LabelView(title: "Time", iconSystemName: "clock", color: .blue)
                }
            }
            
            Button(action: {
                showImagePicker = true
            }) {
                Text("Pick Image")
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker()
            }
            
            
            Section {
                LabelView(title: "Color", iconSystemName: "eyedropper", color: .orange)
                ColorPicker("Color", selection: $hypedEvent.color)
            }
            Section {
                LabelView(title: "URL", iconSystemName: "link", color: .orange)
                TextField("Nintendo", text: $hypedEvent.url)
            }
        }
    }
}


struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
