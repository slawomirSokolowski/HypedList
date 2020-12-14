//
//  UpcomingView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
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

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UpcomingView()
        }
    }
}
