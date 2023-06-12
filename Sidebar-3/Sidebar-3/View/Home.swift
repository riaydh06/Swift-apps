//
//  HomeView.swift
//  Sidebar-3
//
//  Created by Sayed Riaydh on 6/13/23.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $selectedTab){
            HomePage()
                .tag("Home")
            History()
                .tag("History")
            Notification().tag("Notification")
            Settings()
                .tag("Settings")
            Help()
                .tag("Help")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomePage: View{
    var body: some View{
        NavigationView{
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Home")
        }
    }
}

struct History: View{
    var body: some View{
        NavigationView{
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("History")
        }
    }
}

struct Notification: View{
    var body: some View{
        NavigationView{
            Text("Notification")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Notification")
        }
    }
}

struct Settings: View{
    var body: some View{
        NavigationView{
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

struct Help: View{
    var body: some View{
        NavigationView{
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}
