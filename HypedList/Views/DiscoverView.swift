//
//  DiscoverView.swift
//  HypedList
//
//  Created by slawomir  on 19/12/2020.
//

import SwiftUI

struct DiscoverView: View {
    @ObservedObject var data = DataController.shared
    var body: some View {
        HypedEventListView(hypedEvents: data.discoverHypedEvents.sorted { $0.date < $1.date }, noEventsText: "Loading some awesome stuff")
            .navigationTitle("Discover")
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
