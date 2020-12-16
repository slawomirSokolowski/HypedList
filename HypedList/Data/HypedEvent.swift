//
//  HypedEvent.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import Foundation
import SwiftUI
import SwiftDate
import UIColor_Hex_Swift

class HypedEvent: ObservableObject, Identifiable, Codable  {
    
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    @Published var imageData: Data?
    var color = Color.purple
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case url
        case imageData
        case color
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(date, forKey: CodingKeys.date)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(url, forKey: CodingKeys.url)
        try container.encode(imageData, forKey: CodingKeys.imageData)
        try container.encode(UIColor(color).hexString(), forKey: CodingKeys.color)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        imageData = try? values.decode(Data.self, forKey: .imageData)
        
        let colorHex = try values.decode(String.self, forKey: .color)
        color = Color(UIColor(colorHex))
    }
    
    init() {
    }
        
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

