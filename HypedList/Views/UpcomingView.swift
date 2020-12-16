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
        ScrollView {
            VStack {
                if data.hypedEvents.count == 0 {
                    Text("Nothing to look forward to. 😢. bla, bla bla")
                        .bold()
                        .multilineTextAlignment(.leading)
                } else {
                    ForEach(data.hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
                    }
                }
            }
            Text("Upcoming!")
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
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            NavigationView {
//                UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
//            }
//            NavigationView {
//                UpcomingView(hypedEvents: [])
//            }
        }
    }
}

