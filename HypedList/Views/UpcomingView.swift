//
//  UpcomingView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypedEventListView(hypedEvents: data.upcomingHypedEvents, noEventsText: "nothing to look forward to :-(")
            .navigationTitle("Upcoming")
            .navigationBarItems(trailing: Button(action: {
                showingCreateView = true
            }) {
                Image(systemName: "calendar.badge.plus")
            }
            .sheet(isPresented:  $showingCreateView ) {
                CreateHypedEventView()
            }
            )
    }
}


struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}

