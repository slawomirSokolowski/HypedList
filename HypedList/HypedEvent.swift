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
    var imageData: Data?
    var color = Color.purple
    
}
