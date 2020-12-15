//
//  HypedEvent.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject  {
    
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
    hypedEvent.date = Date()
    
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

