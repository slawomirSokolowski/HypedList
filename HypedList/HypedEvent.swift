//
//  HypedEvent.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import Foundation
import SwiftUI
import SwiftDate

class HypedEvent: ObservableObject, Identifiable  {
    
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    @Published var imageData: Data?
    var color = Color.purple
    
    func image() -> Image? {
        if let data = imageData {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return nil
    }
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        if date.compare(.isThisYear) {
        formatter.dateFormat = "MMM d"
        } else {
            formatter.dateFormat = "MMM d yyyy"
        }
        return formatter.string(from: date)
    }
    
    func timeFromNow() -> String {
        return date.toRelative()
    }
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    
    if let image = UIImage(named: "wwdc") {
        if let data = image.pngData() {
            hypedEvent.imageData = data
        }
    }
    hypedEvent.title = "WWDC 2021"
    hypedEvent.color = .green
    hypedEvent.url = "apple.com"
    hypedEvent.date = Date() + 4.days + 2.years
    
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    
    hypedEvent.title = "trip to Jakson & Tennesse"
    hypedEvent.color = .blue
    hypedEvent.url = "jakson.com"
    hypedEvent.date = Date()
    
    return hypedEvent
}

