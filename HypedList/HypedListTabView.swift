//
//  HypedListTabView.swift
//  HypedList
//
//  Created by slawomir  on 14/12/2020.
//

import SwiftUI

struct HypedListTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                UpcomingView()
            }
                .tabItem {
                    Image(systemName: "calendar")
                    Text("upcoming 1")
                }
            
            NavigationView {
                DiscoverView()
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Discover 2")
                }
            
            NavigationView {
                PastView()
            }
                .tabItem {
                    Image(systemName: "gobackward")
                    Text("Past 3")
                }
        }
    }
}


struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}
