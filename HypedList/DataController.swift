//
//  DataController.swift
//  HypedList
//
//  Created by slawomir  on 16/12/2020.
//

import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
    @Published var hypedEvents: [HypedEvent] = []
}

