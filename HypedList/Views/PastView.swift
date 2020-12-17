//
//  PastView.swift
//  HypedList
//
//  Created by slawomir  on 17/12/2020.
//

import SwiftUI

struct PastView: View {
    @ObservedObject var data = DataController.shared
    
   
        var body: some View {
            HypedEventListView(hypedEvents: data.pastHypedEvents, noEventsText: "nothing to look forward to :-( and of course bla , bla blabala")
                .navigationTitle("Past")
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}
