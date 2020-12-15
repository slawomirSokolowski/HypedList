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
