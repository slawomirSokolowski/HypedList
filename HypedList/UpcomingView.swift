//
//  UpcomingView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    var hypedEvents: [HypedEvent] = []
    
    var body: some View {
        ScrollView {
            VStack {
                if hypedEvents.count == 0 {
                    Text("Nothing to look forward to. 😢. bla, bla bla")
                        .bold()
                        .multilineTextAlignment(.leading)
                } else {
                    ForEach(hypedEvents) { hypedEvent in
                        Text(hypedEvent.title)
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
            NavigationView {
                UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
            }
            NavigationView {
                UpcomingView(hypedEvents: [])
            }
        }
    }
}

